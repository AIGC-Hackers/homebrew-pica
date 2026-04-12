class Pica < Formula
  desc "Picadabra CLI"
  homepage "https://github.com/AIGC-Hackers/pica-cli"
  url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.7/pica-bundle.tar.gz"
  sha256 "41ffd7af5fc5fcc8953e921dd3717ba09c49074df6514b445a2de0631dfc15d5"

  depends_on "oven-sh/bun/bun"

  def install
    libexec.install "pica.js"

    (libexec/"pica").write <<~SH
      #!/bin/bash
      exec "#{Formula["oven-sh/bun/bun"].opt_bin}/bun" "#{libexec}/pica.js" ""
    SH
    chmod 0555, libexec/"pica"
    bin.install_symlink libexec/"pica"
  end

  test do
    output = shell_output("#{bin}/pica --help 2>&1")
    assert_match "pica", output
  end
end
