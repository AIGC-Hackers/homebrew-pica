class Pica < Formula
  desc "Picadabra CLI"
  homepage "https://github.com/AIGC-Hackers/pica-cli"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.0/pica-darwin-arm64.tar.gz"
      sha256 "80d78f996ebcf6ad95b968a01af69ab94275803609e264ba8cd74acb9c2d6210"
    else
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.0/pica-darwin-x64.tar.gz"
      sha256 "30f914cb93db333d8cce97f696ade4327fcd6c42e0fcf17bdab819084a3af674"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.0/pica-linux-arm64.tar.gz"
      sha256 "7fc91ee4c743581d51332aae21c668d42d8d2f7f6bcf94100b836c64f4f25cc3"
    else
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.0/pica-linux-x64.tar.gz"
      sha256 "9ce980c097efef6a735ab2f15062133305bce2690f4f4e3a9497878c89bc3090"
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
