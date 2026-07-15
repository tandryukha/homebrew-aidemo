# homebrew-aidemo

Homebrew tap for [**aidemo**](https://github.com/tandryukha/aidemo) — your
coding agent makes the demo video: a narrated, captioned product-demo MP4
rendered from a `storyboard.json`.

## Install

```bash
brew install tandryukha/aidemo/aidemo
```

or:

```bash
brew tap tandryukha/aidemo
brew install aidemo
```

The formula pulls in `node` and `ffmpeg` automatically. aidemo drives your real
Google Chrome (`channel: "chrome"`), which is a cask — install it separately if
you don't have it:

```bash
brew install --cask google-chrome
```

Voice and captions need an OpenAI-compatible endpoint **or** the offline local
provider (`AIDEMO_TTS_PROVIDER=local`). Run `aidemo doctor` to check prereqs.

## Updating the formula

On each npm release, bump `url` + `sha256` in `Formula/aidemo.rb`:

```bash
curl -sL "https://registry.npmjs.org/@tandryukha/aidemo/-/aidemo-<version>.tgz" | shasum -a 256
```

## License

MIT — see [LICENSE](LICENSE). aidemo itself is MIT-licensed at
[tandryukha/aidemo](https://github.com/tandryukha/aidemo).
