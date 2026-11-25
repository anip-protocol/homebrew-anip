class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.20"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.20/anip_0.24.20_darwin_arm64.tar.gz"
      sha256 "0a3922495ad8067be97d745926d3c00309aa8df8d2c22e81b30d46b705cfdc6b"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.20/anip_0.24.20_darwin_amd64.tar.gz"
      sha256 "182daaa5880ee4037ef4e628bb21b38bf0feca543a9fe331bfff7d8b4ad4b007"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.20/anip_0.24.20_linux_arm64.tar.gz"
      sha256 "60091ff617cc31d2e6decf9d13668866c018c5746a62c669f5c1d347b2f51075"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.20/anip_0.24.20_linux_amd64.tar.gz"
      sha256 "ce776f4defd10d4507ec5b45c19707bf7cca7ce3e6413389205468cae9ba32fd"
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
