class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.15/anip_0.24.15_darwin_arm64.tar.gz"
      sha256 "b4d4cc12115c0b7a887d9d4683f7b784f5758ff58363548610f10f95559361f7"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.15/anip_0.24.15_darwin_amd64.tar.gz"
      sha256 "e75221d000eaff9ad60bfce339534b32adfadb3277f8db9f50f4987a5e7dea85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.15/anip_0.24.15_linux_arm64.tar.gz"
      sha256 "424e91e1a0b22d6fa55577f9d3c46b3655c964a4440c5d4fd1fe9664ee3a7e03"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.15/anip_0.24.15_linux_amd64.tar.gz"
      sha256 "494023e60daef0d5aa804f28ff070595a1aafe430ed3f60bf2e643a8aa01aa58"
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
