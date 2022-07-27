## Cosmoscout
Cosmoscout is an explorer service for cosmos based blockchain.

It's inherently built for enterprise-level.

### Run on localhost for test
```shell
# this command runs simple gaiad app & postgres database
$ docker-compose up

# this start to run explorer runtime application
$ cargo run --bin fetcher -- --filename config.toml
```