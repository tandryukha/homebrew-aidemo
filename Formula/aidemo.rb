class Aidemo < Formula
  desc "Render narrated, captioned product-demo videos from a storyboard.json"
  homepage "https://github.com/tandryukha/aidemo"
  # Scoped-package tarball URL: .../@scope/name/-/<name>-<version>.tgz
  url "https://registry.npmjs.org/@tandryukha/aidemo/-/aidemo-0.20.4.tgz"
  sha256 "3d4e2c99b0d7cebfeb12ffb6aceb0397f82ad2340e1a67fe44761ac3ef39a578" # 0.20.4
  license "MIT"

  depends_on "ffmpeg"
  depends_on "node"

  def install
    # aidemo drives system Chrome — no Playwright browser download needed.
    ENV["PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD"] = "1"
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      aidemo drives your real Google Chrome (channel: "chrome").
      Install it separately if you don't have it:
        brew install --cask google-chrome
      Voice/captions need an OpenAI-compatible endpoint OR the local provider
      (AIDEMO_TTS_PROVIDER=local). See: aidemo doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aidemo --version")
  end
end
