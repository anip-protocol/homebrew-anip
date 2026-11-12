class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.19"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.19/anip_0.24.19_darwin_arm64.tar.gz"
      sha256 "7406bb9cde6538edbf37305a0772107bf8a3afbf79727ccaeb43996019cdd361"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.19/anip_0.24.19_darwin_amd64.tar.gz"
      sha256 "37972e74035b03d85b87b4db68a7e80ed0a3746477704855288ec23ffb29ce0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.19/anip_0.24.19_linux_arm64.tar.gz"
      sha256 "2a4ee74d51fbada478b2609f6b36cba22ea44871d9527b3d1500aae77eb4c9be"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.19/anip_0.24.19_linux_amd64.tar.gz"
      sha256 "6ed967dacb7ad21034af7f63a28b8c5013dfcaf7183425472e3e7c57e784c46b"
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
