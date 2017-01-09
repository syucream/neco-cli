# neco-cli
[mruby-neco](https://github.com/syucream/mruby-neco) CLI

# Commands

## get

Get from DBs specified `--open` options. The value is encoded by JSON.
```
$ neco-cli get <key> [--open <db options as JSON>]
```

## put

Put values to DBs specified `--open` options.
```
$ neco-cli put <key> <value> [--open <db options as JSON>]
```

# Example

```
$ neco-cli help
  usage: neco-cli <subcmd>
         neco-cli get <key> [--open <db options as JSON>]
         neco-cli put <key> <value> [--open <db options as JSON>]

  example: neco-cli set "key1" "value1" --open '{"name": redis, "addr": "127.0.0.1", "port": 6379}'

$ neco-cli put key hoge --open '{"name": "redis", "host": "127.0.0.1", "port": 6379}'
$ neco-cli get key --open '{"name": "redis", "host": "127.0.0.1", "port": 6379}'
{"redis":"hoge"}

$ neco-cli put key fuga --open '{"name": "redis", "host": "127.0.0.1", "port": 6379}' --open '{"name": "etcd", "url": "http://127.0.0.1:2379/v2"}'
$ neco-cli get key --open '{"name": "redis", "host": "127.0.0.1", "port": 6379}' --open '{"name": "etcd", "url": "http://127.0.0.1:2379/v2"}'
{"redis":"fuga","etcd":"fuga"}
```
