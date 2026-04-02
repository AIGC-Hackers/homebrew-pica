class Pica < Formula
  desc "Picadabra CLI"
  homepage "https://github.com/AIGC-Hackers/pica-cli"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.1.1/pica-darwin-arm64.tar.gz"
      sha256 "b1d3a9e1285bedfc55533a024be2219c3eba022562ff3e96d90621edcb7cde08"
    else
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.1.1/pica-darwin-x64.tar.gz"
      sha256 "54e8daa6752baaef61c6874a3f7121df00029054046ae8b194d9446f92ca10cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.1.1/pica-linux-arm64.tar.gz"
      sha256 "8bee5859866e87ee9e6e26175a0be6880cad116948f93f472c6e81267e81e5c2"
    else
      url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.1.1/pica-linux-x64.tar.gz"
      sha256 "1e29998b8ca917ca19ca4057cf8fd8204b4fbbed2636eabf705a54432abd12ba"
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
