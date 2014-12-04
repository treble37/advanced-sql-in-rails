Code for a job interview, published here for posterity.

[https://github.com/jwhiteman/baseball-stats][https://github.com/jwhiteman/baseball-stats]

Supposed to showcase object orientation (decent use of SRP throughout),
View backed models, Arel, moderately complex queries, etc.

There are no controllers or standard views, but I've attached some simple
endpoints in the router.

```bash
bundle install

rake db:create # alter database.yml to taste.
rake db:migrate

bin/rake run

bin/rake explain
```
