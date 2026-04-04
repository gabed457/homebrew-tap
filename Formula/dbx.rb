class Dbx < Formula
  desc "Terminal Database IDE — DataGrip-level exploration in a single binary"
  homepage "https://github.com/gabed457/dbx"
  url "https://github.com/gabed457/dbx/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "05b88fefe9d04833c6c709597bd9bc2ca796fab1307ce99713eb66bf2572568e"
  license "MIT"
  head "https://github.com/gabed457/dbx.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/dbx-dev/dbx/cmd.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dbx --version")
  end
end
