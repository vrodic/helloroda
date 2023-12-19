Simple Roda benchmark, run with

```
RUBY_YJIT_ENABLE=1 TABLE=users DBNAME=dbname bundle exec puma -C config/mri_puma.rb -b tcp://0.0.0.0:8080 -e production
```

`DBNAME` is your postgres database name
`TABLE` table you wish to serialize 10 rows of

Test with:

```
wrk  http://localhost:8080/db
```