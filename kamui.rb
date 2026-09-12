class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "e11e215441ac22388986c2444fad32637ab8e81474a4a1baedfcb566acf5e48b"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=636487057f66b2c8ca0d6737251ade71266ff26c " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-09-12T05:03:06-04:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
