class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.8/anip_0.24.8_darwin_arm64.tar.gz"
      sha256 "4ecdc4c28debbea1b771a56fb1282b21e913ca549c822067d4a0be4496998815"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.8/anip_0.24.8_darwin_amd64.tar.gz"
      sha256 "e99eb5071f74e3b0fbac67da9ce22129853e52d10f630b60e5eb2e5c2c83de7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.8/anip_0.24.8_linux_arm64.tar.gz"
      sha256 "7eca2a00dd9f84762942f2eb77764c6da1c1d327aeb1388fea8038860d0c87a7"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.8/anip_0.24.8_linux_amd64.tar.gz"
      sha256 "190d47e43a17aff2210a3cb63cfcb42c059c0fe32922d7b0abaac524403fb06c"
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
