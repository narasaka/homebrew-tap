class AdaptiveScroll < Formula
  desc "Adaptive scroll direction for macOS based on external mouse connection"
  homepage "https://github.com/narasaka/adaptive-scroll"
  url "https://github.com/narasaka/adaptive-scroll/releases/download/v0.0.11/adaptive-scroll"
  sha256 "6d7c9badb4c92edecf2b654d380d828654b9cc800e17151085cf3c36af031284"
  version "v0.0.11"

  def install
    bin.install "adaptive-scroll"
  end

  service do
    run [opt_bin/"adaptive-scroll"]
    keep_alive true
    run_at_load true
  end

  def caveats
    <<~EOS
      Accessibility Permission Required!

      Adaptive Scroll uses macOS's event system to modify scroll direction.
      You must grant it Accessibility access for it to function.

      To start the service:
        brew services start adaptive-scroll

      Once that is running, you need to enable permissions. Go to:
        System Settings -> Privacy & Security -> Accessibility

      Enable the toggle / switch for `adaptive-scroll`

      To stop the service:
        brew services stop adaptive-scroll
    EOS
  end
end
