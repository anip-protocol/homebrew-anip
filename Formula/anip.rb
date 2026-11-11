class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.17/anip_0.24.17_darwin_arm64.tar.gz"
      sha256 "c642ef4f5960fa99ce6f2fa8574e5f6d769052532ae2fd7d206ca42b146ffa38"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.17/anip_0.24.17_darwin_amd64.tar.gz"
      sha256 "4b5f1bc4326560fe0bf387079881205fb2024438bdd1855b55c0854f54d80372"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.17/anip_0.24.17_linux_arm64.tar.gz"
      sha256 "bb4311f216b3924594887367ddfde5b393dc42447ff01f284eda681abdcbcbad"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.17/anip_0.24.17_linux_amd64.tar.gz"
      sha256 "95b493b7f535f13e966979fa4fdafe811dcaea9c58a135841cb8fc3e8d526113"
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
