class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "ebea688134ed610eb78060962f05042c113778bc5fa47fdf720db0376b778a02"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=317e1c57610c35e9c304968074a17eddbf3b0dea " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-14T13:40:34-04:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
