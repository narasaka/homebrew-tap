class AdaptiveScroll < Formula
  desc "Adaptive scroll direction for macOS based on external mouse connection"
  homepage "https://github.com/narasaka/adaptive-scroll"
  url "https://github.com/narasaka/adaptive-scroll/releases/download/v0.0.1/adaptive_scroll"
  sha256 "dummy"
  version "0.0.1"

  def install
    bin.install "adaptive_scroll"
  end

  service do
    run [opt_bin/"adaptive_scroll"]
    keep_alive true
    run_at_load true
  end
end