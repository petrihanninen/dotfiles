# In duunitori5
`cdt`

copies
```bash
cp ./docker/app/custom_settings.py ./duunitori/
cp ./docker/app/custom_settings_test.py ./duunitori/
cp .env.dist .env

```

direnv
```bash
direnv allow .
```

(get and generate aws access keys) is this necessary? docker compose up breaks with these installed

`gh auth login`

Init db
```bash
make all
make app-initial-migrate
make app-es-indices
```

Add data (note: this will change soon)
```bash
make app-fixtures
make app-run-command command="fetch_articles --fast --verbose"
make app-run-command command="fetch_job_entries --amount 1000"
make app-run-command command="tag_jobentries --verbose"
make app-es-index
```


# duunitori-next
```bash
cp apps/jobbland.no/.env.local.example apps/jobbland.no/.env.local
cp apps/jobbland.se/.env.local.example apps/jobbland.se/.env.local
cp apps/jobbsafari.no/.env.local.example apps/jobbsafari.no/.env.local
cp apps/duunitori.fi/.env.local.example apps/duunitori.fi/.env.local
```

# duunitori-backend
```bash
cp local_settings.py.tpl_dev local_settings_dev.py
```
Uncomment line that disables token requirement
Add `ARBEIDSPLASSEN_API_KEY` (found at least in Slack)

```bash
docker compose up
```
