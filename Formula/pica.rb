class Pica < Formula
  desc "Picadabra CLI"
  homepage "https://github.com/AIGC-Hackers/pica-cli"
  url "https://github.com/AIGC-Hackers/pica-cli/releases/download/v0.2.4/pica-bundle.tar.gz"
  sha256 "fd61d54a182b5c57bce2f71ce6dae61342b5b69c706df4edcd6d8bf9edc27e7c"

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
