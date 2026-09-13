class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "bca54456ebca8de45ba53a86a667e6086871f54d72f4a6d7215926121c95d311"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=877e23f814fe8b25057866ab932cfc365ef13ced " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-12T22:12:05-04:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
