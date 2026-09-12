class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "63919608cc678f34292f21044b6a5c2178a1e10eb01ce639e4841773a64a579a"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=fd3066837dd2eb48b113d3be47c39ce86eb0e3d4 " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-12T12:55:37-04:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
