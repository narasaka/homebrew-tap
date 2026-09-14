class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "0256481a73b3d0e98f21fc4616831799469153af59bd1f0ac0872de192e330d1"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=094945224f74c8339671e9fe98ecb87c0c12152b " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-13T20:44:25-07:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
