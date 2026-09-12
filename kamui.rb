class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "9dde3e93b1c4c31ce55e2c3c3de223af28585532f28b542f32b437ddd30fbf71"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=8eebd46f008f92ba84b0fff48a4cde104259ac43 " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-12T00:42:12-04:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
