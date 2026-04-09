class Pica < Formula
  desc "Picadabra CLI"
  homepage "https://github.com/AIGC-Hackers/pica-cli"
  url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.6/pica-bundle.tar.gz"
  sha256 "8dfecb58529bc148fa95c95dbf493dd4fcb7d9d343eb5c94313ff459ac87aaf0"

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
