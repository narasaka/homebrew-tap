class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.11.tar.gz"
  sha256 "031fde7d08707e43b3e9858ba5fba9e8a900473126d4ea8afbde4953d52d178e"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=979b43ffb1ba0c3608f06e98b036627fdaea889d " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-19T11:58:04-04:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
