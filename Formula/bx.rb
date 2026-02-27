class Bx < Formula
  desc "Terminal-first CLI for executing Bruno API collections"
  homepage "https://github.com/gabed457/bx"
  url "https://github.com/gabed457/bx/releases/download/v0.1.3/bx-0.1.3.tar.gz"
  sha256 "75a01c04d0d3b668d0e19542c55d3d0b8d5d5d171e0a0ff5cc9cb6ed29c327b4"
  license "MIT"

  def install
    # Install into libexec to preserve relative path resolution
    # bx resolves libs via $BX_BIN/../lib relative to BASH_SOURCE[0]
    libexec.install "bin", "lib"
    chmod 0755, libexec/"bin/bx"
    bin.write_exec_script libexec/"bin/bx"

    bash_completion.install "completions/bx.bash" => "bx"
    zsh_completion.install "completions/bx.zsh" => "_bx"
    fish_completion.install "completions/bx.fish"
  end

  test do
    assert_match "bx v#{version}", shell_output("#{bin}/bx version")
  end
end
