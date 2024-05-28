alias d3mdl='cd ~/Teldio/d3m && heroku pg:backups:download -a teldiod3 -o db/latest.dump'
alias d3mrs='pg_restore --clean -d d3_development db/latest.dump'
