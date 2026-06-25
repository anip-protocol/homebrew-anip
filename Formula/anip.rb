class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.9/anip_0.24.9_darwin_arm64.tar.gz"
      sha256 "36d5c5b43910d6b3a6b03536081e0f5666ae7d4e8a1a14c8f1b25dfe5ac110c4"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.9/anip_0.24.9_darwin_amd64.tar.gz"
      sha256 "9b08011646943401e539b20986e455ed30ad36480634d8c045d15f3a7935c251"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.9/anip_0.24.9_linux_arm64.tar.gz"
      sha256 "2753b583e414c6f9ae40f1d2675e7d5f483b95c7c53125438ffb1979e2076a57"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.9/anip_0.24.9_linux_amd64.tar.gz"
      sha256 "27919094b9c15eaa19c324d0589c949495d07cceb8f4a2d9702816acf9cec090"
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
