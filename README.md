# AwesomeEvents

『パーフェクト Ruby on Rails』のサンプルアプリ。

## インストール

```
$ brew install vips
$ bin/setup
```

### Elasticsearchのインストール

```
$ brew tap elastic/tap
$ brew install elastic/tap/elasticsearch-full
$ elasticsearch-plugin install analysis-kuromoji
```

### Elasticsearchの起動
```
$ elasticsearch
$ bin/rails r Event.reindex
```
