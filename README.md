# homebrew-rastray

Homebrew tap for [`rastray`](https://github.com/balangyaoejuspher/rastray) — a
blazing-fast static analysis CLI for security, dependency, and performance
audits.

## Install

```sh
brew install balangyaoejuspher/rastray/rastray
```

That's it — `brew tap` is run implicitly the first time. If you prefer the
explicit form:

```sh
brew tap balangyaoejuspher/rastray
brew install rastray
```

## Updates

```sh
brew update
brew upgrade rastray
```

The formula is bumped automatically on every `rastray` release tag. If you're
seeing a stale version, run `brew update` first to refresh the tap.

## Platforms

The bottle pulls the matching release tarball from the upstream GitHub release:

| platform           | tarball                                                           |
| ------------------ | ----------------------------------------------------------------- |
| macOS Apple Silicon | `rastray-v<version>-aarch64-apple-darwin.tar.gz`                  |
| macOS Intel        | `rastray-v<version>-x86_64-apple-darwin.tar.gz`                   |
| Linux x86_64       | `rastray-v<version>-x86_64-unknown-linux-gnu.tar.gz`              |

Windows is not covered by Homebrew. Use the [Scoop bucket](https://github.com/balangyaoejuspher/scoop-rastray)
or the [shell installer](https://github.com/balangyaoejuspher/rastray#installation)
instead.

## Source of truth

The canonical formula lives in the main repo at
[`dist/homebrew/rastray.rb`](https://github.com/balangyaoejuspher/rastray/blob/main/dist/homebrew/rastray.rb).
This tap mirrors that file verbatim. Issues, feature requests, and pull
requests should be opened against the main repo, not this tap.

## License

The formula itself is licensed MIT OR Apache-2.0, matching `rastray`.
