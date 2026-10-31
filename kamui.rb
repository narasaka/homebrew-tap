class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.12.tar.gz"
  sha256 "8d3677b3fa0c07d5111793c9b2f868954f8c29b5613f563c9ce23d044fd31753"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=ee75340d0496a7c2e311f6794607b066c52b2dbf " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-10-31T02:42:51-04:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
