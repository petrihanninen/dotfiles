function aws_login() {
	re='^[0-9]{6}$'
	code=$1

	if ! [[ $code =~ $re ]]; then
		code=$(pbpaste)

		if ! [[ $code =~ $re ]]; then
			echo "Usage: aws_login <one time password> or have the code in the clipboard"
			return 1
		fi
	fi

	mv -f $HOME/.aws/credentials.bak $HOME/.aws/credentials
	creds_json="$(aws sts get-session-token --serial-number arn:aws:iam::406149857314:mfa/petri --profile duunitori --token-code $code)"
	fields="$(jq '.Credentials | .AccessKeyId, .SecretAccessKey, .SessionToken' -r <<<"$creds_json")"
	expiry="$(jq '.Credentials | .Expiration' -r <<<"$creds_json")"
	output="$(sed -e '1 s/.*/aws_access_key_id = &/' -e '2 s/.*/aws_secret_access_key = &/' -e '3 s/.*/aws_session_token = &/' <<<"$fields")"
	mv $HOME/.aws/credentials $HOME/.aws/credentials.bak
	echo "[default]" >>$HOME/.aws/credentials
	echo "$output" >>$HOME/.aws/credentials

	echo >>$HOME/.aws/credentials

	echo "[duunitori]" >>$HOME/.aws/credentials
	echo "$output" >>$HOME/.aws/credentials

	echo "session expires at $expiry"
}

alias al=aws_login
