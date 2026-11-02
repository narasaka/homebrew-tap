class Kamui < Formula
  desc "Use a remote SSH host's loopback services in a development browser"
  homepage "https://github.com/narasaka/kamui"
  url "https://github.com/narasaka/kamui/archive/refs/tags/v0.0.14.tar.gz"
  sha256 "0ad5fa1260eaf09327120d9fd8dd10463873058d1374e7d96f9c2a35edd3ba14"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-buildid= " \
              "-X github.com/narasaka/kamui/internal/version.Version=#{version} " \
              "-X github.com/narasaka/kamui/internal/version.Commit=52d8dc9e33150c496fe5e3f3289391ca770c029b " \
              "-X github.com/narasaka/kamui/internal/version.BuildDate=2026-11-02T18:02:46-05:00"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kamui"
  end

  test do
    assert_match "kamui version #{version}", shell_output("#{bin}/kamui --version")
  end
end
