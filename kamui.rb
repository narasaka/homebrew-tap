class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "b938c839eea01a73558d676b21c378750fa5ab70ccd8805e8747be9f82e326af"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=7ba8df5c7f0adf0d654b2c2eeffcb0d75545674f " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-11T23:59:35-07:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
