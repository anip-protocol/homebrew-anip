class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.16"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.16/anip_0.24.16_darwin_arm64.tar.gz"
      sha256 "a2dade72b72debffa9c8d336dacc73c4e0d67c32af74df747aa8dd3156375678"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.16/anip_0.24.16_darwin_amd64.tar.gz"
      sha256 "54e3debc0b12ecb74b49cb32409d26f806db7e3d92e11ecb2e70ae5aa057f4ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.16/anip_0.24.16_linux_arm64.tar.gz"
      sha256 "b3d04aeaa329c61366725eb33a2ebe5d3f7a47ec3053a75b68f585ba22aa8977"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.16/anip_0.24.16_linux_amd64.tar.gz"
      sha256 "ac72af86baf36290951c5e03dc710e423e32756a0b62b3f1f074f93d472bba35"
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
