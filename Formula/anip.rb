class Anip < Formula
  desc "ANIP contract generator and validator CLI"
  homepage "https://anip.dev"
  version "0.24.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.6/anip_0.24.6_darwin_arm64.tar.gz"
      sha256 "32dbff28fc92e95c79ab4bc3cbbc84b94abef2459d45a117ee2323161eb4dd7e"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.6/anip_0.24.6_darwin_amd64.tar.gz"
      sha256 "c8685c78d08b6ebac4ec8ea0e2871c98b1ffd44e1a030fd62c504512dd6158c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.6/anip_0.24.6_linux_arm64.tar.gz"
      sha256 "1b0c7e5f17a9ebe0ed3c3b3f71a6df3e6ab78f5fcd361a6068f8917ba433abd1"
    else
      url "https://github.com/anip-protocol/anip/releases/download/v0.24.6/anip_0.24.6_linux_amd64.tar.gz"
      sha256 "394d63543ffa822fef4c37b75722df36f58597fd7070ba5ef887b9838c8378bb"
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
