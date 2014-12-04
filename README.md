Code for a job interview.

Supposed to showcase object orientation (pretty heavy use of SRP throughout),
View backed models, Arel, moderately complex queries, & simple use of stored
procedures.

```bash
bundle install

rake db:create # alter database.yml to taste.
rake db:migrate

bin/rake run

bin/rake explain
```
