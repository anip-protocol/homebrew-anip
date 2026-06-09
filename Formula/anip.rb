class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.5/anip_0.24.5_darwin_arm64.tar.gz"
      sha256 "9662877bf62039e09b76f420d266bb5bb8e0347fbcea89feb42e6cb2b44208be"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.5/anip_0.24.5_darwin_amd64.tar.gz"
      sha256 "4a9492179d233366116ed9235046d3670afb79846a433b7de7f90113a9655e66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.5/anip_0.24.5_linux_arm64.tar.gz"
      sha256 "6cda320ee5e9e3947a97b4ed8107ed8c609f376632fc346d03184aaf9596cc62"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.5/anip_0.24.5_linux_amd64.tar.gz"
      sha256 "7bd21f0afa9a1928010fab2f1f09962e520d714fb959b7b92b29b24db3e3544f"
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
