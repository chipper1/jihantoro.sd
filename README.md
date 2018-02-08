# jihantoro.sd [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/veelenga/awesome-crystal)

An [Serdar Dogruyol's](http://serdardogruyol.com) blog written in Crystal Kemal

### Stack
* [Crystal Kemal](http://kemalcr.com)
* [Python Flask](http://flask.pocoo.org/)
* SQLite - `apt-get install libsqlite3-dev`
* [Redis](https://redis.io/download)
* [Crystal](https://crystal-lang.org)
* [Python 2.7](https://www.python.org/download/releases/2.7/)

## Installation

### Crystal Language installation

```shell
sudo apt-get install \
  libbsd-dev \
  libedit-dev \
  libevent-core-2.0-5 \
  libevent-dev \
  libevent-extra-2.0-5 \
  libevent-openssl-2.0-5 \
  libevent-pthreads-2.0-5 \
  libgmp-dev \
  libgmpxx4ldbl \
  libssl-dev \
  libxml2-dev \
  libyaml-dev \
  libreadline-dev \
  automake \
  libtool \
  git \
  llvm \
  libpcre3-dev \
  libgc-dev \
  zlib1g-dev \
  build-essential -y
curl https://dist.crystal-lang.org/apt/setup.sh | sudo bash
sudo apt-get install crystal
```

### Clone repository

```shell
git clone https://github.com/codenoid/jihantoro.sd
cd jihantoro.sd
shards install
crystal run src/jihantoro.cr
```

## Usage

I use SQLite3 as the database (libsqlite3-dev)

## Development

- [x] Flask as Admin Panel
- [ ] Fix bad logic
- [ ] Fix bad feature

## Contributing

1. Fork it ( https://github.com/codenoid/jihantoro.sd/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [codenoid](https://github.com/codenoid) Rubi Jihantoro - creator, maintainer
