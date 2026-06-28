class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.12/anip_0.24.12_darwin_arm64.tar.gz"
      sha256 "720870e8fbb83c8400a16c6d6b88cca8f4828233c6eb7b66abdb093a2f8ddaab"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.12/anip_0.24.12_darwin_amd64.tar.gz"
      sha256 "70d947d8fbe9f95cafdfe7d504e243e714e7fb0490feb42632a6668bc5e38576"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.12/anip_0.24.12_linux_arm64.tar.gz"
      sha256 "f7fc9535944a1bda9f14700ae766390c1e8da4b437484f982e37464df8fcc8b3"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.12/anip_0.24.12_linux_amd64.tar.gz"
      sha256 "b2072abc8d91308f12498bbdc978d8529ecf191187a2144a0aacfd55f20c86db"
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
