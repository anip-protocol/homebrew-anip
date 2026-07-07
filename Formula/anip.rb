class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.13/anip_0.24.13_darwin_arm64.tar.gz"
      sha256 "f44fb7d1af9bb62ad6e301a677ae5083f60513392ecc97a9efc073766c713992"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.13/anip_0.24.13_darwin_amd64.tar.gz"
      sha256 "ad8b1fbd492f297430b8b8dfdb5d9919caceca39a8048195891648c1b4b4c173"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.13/anip_0.24.13_linux_arm64.tar.gz"
      sha256 "6f10bead44b59c9b3e0c6b8fa6f11c95d8703bce93fd58ecb561be5b2ddeecd6"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.13/anip_0.24.13_linux_amd64.tar.gz"
      sha256 "1be8ca11034b8299236d758a73e64bea2b8f85b288d392725db6eb2af9d56db5"
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
