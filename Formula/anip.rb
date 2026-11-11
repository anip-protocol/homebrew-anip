class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.18"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.18/anip_0.24.18_darwin_arm64.tar.gz"
      sha256 "babc6316ffd58e5f4f124bc8b28d7acea37ac040ea7b2d12fbea2322fde46855"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.18/anip_0.24.18_darwin_amd64.tar.gz"
      sha256 "ac954b54e10c1a1092fafab2d0d90cc214af8368c6caaf81e33d4bb6156a88d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.18/anip_0.24.18_linux_arm64.tar.gz"
      sha256 "7c276a4c31435fe836cfc5f2b641129860b33ff5886d1477f488ff89ffec0e64"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.18/anip_0.24.18_linux_amd64.tar.gz"
      sha256 "baf58be3495306843e29465f632f6eae6ebc38adcceee058241df079e9d4f673"
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
