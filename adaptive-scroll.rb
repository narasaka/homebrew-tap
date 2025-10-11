class AdaptiveScroll < Formula
  desc "Adaptive scroll direction for macOS based on external mouse connection"
  homepage "https://github.com/narasaka/adaptive-scroll"
  url "https://github.com/narasaka/adaptive-scroll/releases/download/v0.0.10/adaptive-scroll"
  sha256 "6d7c9badb4c92edecf2b654d380d828654b9cc800e17151085cf3c36af031284"
  version "v0.0.10"

  def install
    bin.install "adaptive_scroll"
  end

  service do
    run [opt_bin/"adaptive_scroll"]
    keep_alive true
    run_at_load true
  end
end