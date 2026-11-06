class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.15.tar.gz"
  sha256 "f0a59bbba68abbb876bcaf79029bfead0d422eaee4331868a041f5a6dffee377"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=361d6d0572030d3e23272ca180bed544cc48396a " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-11-06T16:07:51-05:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
