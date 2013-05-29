# statsite-instrumental

Data sink for [Statsite](https://github.com/armon/statsite) and
[Instrumental](https://instrumentalapp.com/)

## Install

```console
$ gem install statsite-instrumental
```

## Configuration

To use the sink you need to set `stream_cmd` in your config for statsite. Make
sure you're using the correct path to the executable and supply your
instrumental API key as the only argument to the script.

```
[statsite]
stream_cmd = /usr/bin/statsite-instrumental [api key]
```

## Note on Patches/Pull Requests

* Fork the project.
* Add tests to show the problem or test your feature
* Make your feature addition or bug fix.
* Send me a pull request. Bonus points for topic branches.

Please don't make changes to the Rakefile, version, or history.

## Development

```console
$ gem install bundler
$ bundle
$ guard
```

## Copyright

See LICENSE for details.
