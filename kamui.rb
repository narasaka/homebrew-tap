class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.13.tar.gz"
  sha256 "68d684e839ba3de4214486fb3911b1024b82a87c4728a343761c9ca921035f70"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=40609b447b4c73da3186cefd6ac0a14b67645133 " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-11-02T14:32:01-05:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
