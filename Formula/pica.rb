class Pica < Formula
  desc "Picadabra CLI"
  homepage "https://github.com/AIGC-Hackers/pica-cli"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.3/pica-darwin-arm64.tar.gz"
      sha256 "bc15fb2fa69c3633eba3049b1e25e4efa3bc36d1d81f812279be8f42891feea6"
    else
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.3/pica-darwin-x64.tar.gz"
      sha256 "881265570d9031f3dceeb36b1192a9eadeb3c4c0f948eba5f38b71a9f46eb344"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.3/pica-linux-arm64.tar.gz"
      sha256 "6987b067617f8a79307da5650e19f7554950dcb6f807bd7d80798acd4593cc17"
    else
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.3/pica-linux-x64.tar.gz"
      sha256 "e6675b7a7cc81a134e751ea4533934d4bc81000cb53f90e80939bfa0520e7ee5"
    end
  end

  def install
    bin.install "pica"
  end

  test do
    output = shell_output("#{bin}/pica --help 2>&1")
    assert_match "pica", output
  end
end
