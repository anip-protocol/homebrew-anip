class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.7/anip_0.24.7_darwin_arm64.tar.gz"
      sha256 "cdba1ca05b81eba01e18e5bc696fa633e8d17115811563a5b9a1f2a7dbabca01"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.7/anip_0.24.7_darwin_amd64.tar.gz"
      sha256 "8cdd0a592fc9642faf7d0c19b29f37efbe80bc27fa0a91e4c4d83d6b26fd4879"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.7/anip_0.24.7_linux_arm64.tar.gz"
      sha256 "02f78264ce0a4f74ff01102d76adcd12b5dbb6178d1ce47b08b402cc8a8b69bc"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.7/anip_0.24.7_linux_amd64.tar.gz"
      sha256 "bbeac799b497b489e7031cf5c5898c58d7959c57be98b8d91ed31d22ef393136"
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
