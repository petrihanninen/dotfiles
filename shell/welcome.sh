# shell/welcome.sh — greeting banner (interactive shells only).

case "$-" in
  *i*)
    cat <<'EOF'

  ,-~~-._____.
 / |  '       \         It was a dark and stormy night....
(  )           0
 \_/-, ,------'
    ====           //
   /  \-'~;    /~~~(O)
  /  __/~|   /       |
=(  _____| (_________|

EOF
    ;;
esac
