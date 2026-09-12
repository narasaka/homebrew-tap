class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "08b32639f99c6f78a07b459816421f3a48e48b08b308ad349f7d3f9eb675fa1f"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=b03accc691aaa67cbe8a43cfcf0ec555359950d1 " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-12T06:15:02-04:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
