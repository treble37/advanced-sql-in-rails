Code challenge for an old job interview, published here for posterity.

[https://github.com/jwhiteman/baseball-stats](https://github.com/jwhiteman/baseball-stats)

Supposed to showcase object orientation (decent use of SRP throughout),
View backed models, Arel, moderately complex queries, etc. MySQL specific.

FYI, almost no logic lives in models, proper. Everything has been pulled into
`app/queries`, `app/presenters` & `lib`...and a decent amount in `app/sql`
templates (its not standard, but that was the spirit of the exercise.)

There are no controllers or standard views, but I've attached some simple
endpoints in the router.

```bash
bundle install

rake db:create # alter database.yml to taste.
rake db:migrate

bin/rake run

bin/rake explain
```
