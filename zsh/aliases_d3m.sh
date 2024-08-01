alias d3mdl='cd ~/code/teldio-operations/d3m && heroku pg:backups:download -a teldiod3 -o db/latest.dump'
alias d3mrs='cd ~/code/teldio-operations/d3m && pg_restore --clean -d d3_development db/latest.dump'
