class Pica < Formula
  desc "Picadabra CLI"
  homepage "https://github.com/AIGC-Hackers/pica-cli"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.1.0/pica-darwin-arm64.tar.gz"
      sha256 "ed9c940f16f4a552bab6ce6f143a6b36f47c408a8c0ed90b2001e558ee5eece1"
    else
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.1.0/pica-darwin-x64.tar.gz"
      sha256 "dfbae89b264b6ab79579772863d20b55a46f6eaeb33efa342cf1e76c490a692c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.1.0/pica-linux-arm64.tar.gz"
      sha256 "85409248eb3f07435a40ffb3d4eef0713f673f91347b1be1da5de584f4984036"
    else
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.1.0/pica-linux-x64.tar.gz"
      sha256 "1c1b93f763c94c7e2126c4678e8bf6318c49d499c00f97303ff806f9fa70b859"
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
