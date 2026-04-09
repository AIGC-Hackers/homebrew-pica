class Pica < Formula
  desc "Picadabra CLI"
  homepage "https://github.com/AIGC-Hackers/pica-cli"
  url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.5/pica-bundle.tar.gz"
  sha256 "3d531e8ff5076dca311941ab1c26f83665a2d2ad6fc647413f94ba9f9eaa42e3"

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
