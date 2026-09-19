class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "91f6540ad1a2665c747dcfe2229b71040636893cbefe072d7410ed28d234fadd"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=c99a5a2ef042d0ce848e8a5553fde62b15934741 " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-18T21:41:34-04:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
