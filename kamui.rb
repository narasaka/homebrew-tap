class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "fab0421f4d8a403deafeec351bf78ce4c581f2f480e116fb560da8b8282c95cf"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=467dec432d5ef79f1ba16daea7ee861aacd68cf0 " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-14T00:28:14-04:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
