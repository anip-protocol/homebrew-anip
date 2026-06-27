class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.11/anip_0.24.11_darwin_arm64.tar.gz"
      sha256 "cd27bb2fa4adeaec47e1fd33d185829d951cbcdfb0f6b92c2298f2c9523d9ae3"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.11/anip_0.24.11_darwin_amd64.tar.gz"
      sha256 "e87fb55eab7ad0936aaf6ba2bd23699f5cbe2e30616a8e3cab8bbd05e3acf32e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.11/anip_0.24.11_linux_arm64.tar.gz"
      sha256 "f6273bab1edb0827f1a0a0065310b1cc629540d1a22690cf19eb7bcf7a85e2c0"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.11/anip_0.24.11_linux_amd64.tar.gz"
      sha256 "3c375bacedd23b47186464dbd3a84470f699164acd6642f2bd117b68c0f1d774"
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
