class Pica < Formula
  desc "Picadabra CLI"
  homepage "https://github.com/AIGC-Hackers/pica-cli"
  url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.3/pica-bundle.tar.gz"
  sha256 "78330383a28d93a589c295e598c6ff79b4e31293111f66c815794426ca08f9ec"

  depends_on "oven-sh/bun/bun"

  def install
    libexec.install "pica.js"

    (libexec/"pica").write <<~SH
      #!/bin/bash
      exec "#{Formula["oven-sh/bun/bun"].opt_bin}/bun" "#{libexec}/pica.js" "$@"
    SH
    chmod 0555, libexec/"pica"
    bin.install_symlink libexec/"pica"
  end

  test do
    output = shell_output("#{bin}/pica --help 2>&1")
    assert_match "pica", output
  end
end
