class Pica < Formula
  desc "Picadabra CLI"
  homepage "https://github.com/AIGC-Hackers/pica-cli"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.1/pica-darwin-arm64.tar.gz"
      sha256 "c99f62d6251ce416a2596f333097605c89859eed7dfcc1742cba47feb297c465"
    else
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.1/pica-darwin-x64.tar.gz"
      sha256 "919f90f80333d9d5db04831cfdfa5f9c1c046e8718302890e45093c9227a59c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.1/pica-linux-arm64.tar.gz"
      sha256 "5911ef447bc5704c9d90dc29e558d7f032b2b0b57931a4aa656a4035957d8353"
    else
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.1/pica-linux-x64.tar.gz"
      sha256 "9037517375224588d33eb2cb1f6a391044f198d1e63071edce53285533b5154d"
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
