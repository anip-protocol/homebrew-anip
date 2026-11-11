class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.14/anip_0.24.14_darwin_arm64.tar.gz"
      sha256 "090c9960c20081b1ccbee33ad140261992007a40464029e72d5f312c0e39409b"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.14/anip_0.24.14_darwin_amd64.tar.gz"
      sha256 "3ab95ab82659a25d0f5e1a38132f8f71a88b68d43739ae80b9807811859877b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.14/anip_0.24.14_linux_arm64.tar.gz"
      sha256 "f59809a0465e1f3918dbd7d5ba4fea0602d99b90874bcba7d45ef487c6f4eef8"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.14/anip_0.24.14_linux_amd64.tar.gz"
      sha256 "8918ef7a40e9326d605584ba8ed6a7ae5ac01dcc7e2f70fceff789c4ff04be27"
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
