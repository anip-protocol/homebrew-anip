class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.10/anip_0.24.10_darwin_arm64.tar.gz"
      sha256 "9d6839d809d3762cdec8e4511f2ba74d06b58b55a2ad85b7d1035e7ec813181a"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.10/anip_0.24.10_darwin_amd64.tar.gz"
      sha256 "35aadedf51d3a037d832f6ab3379ef48bba6e11e8d3dcd11f325cc0cdbd82769"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.10/anip_0.24.10_linux_arm64.tar.gz"
      sha256 "25104880b92adeca0980f2b8404e73349e66cd96c50b08e1a219cd1235cded44"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.10/anip_0.24.10_linux_amd64.tar.gz"
      sha256 "258acab6653df2de58e9b7e3d3ea3028e9dcd136d955500fbc15a503b424abe6"
    end
  end

  def install
    bin.install "anip"
    bin.install "anip-generate"
    bin.install "anip-verify"
  end

  test do
    version_output = shell_output("#{bin}/anip version")
    assert_match "anip CLI #{version}", version_output
    assert_match "ANIP spec anip/0.24", version_output
    assert_match "anip generate --definition <file>", shell_output("#{bin}/anip generate --help")
    assert_match "anip validate --definition <file>", shell_output("#{bin}/anip validate --help")
  end
end
