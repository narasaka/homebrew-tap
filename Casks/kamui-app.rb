cask "kamui-app" do
  version "0.0.12"
  sha256 "735fb6020d9d3133231c10742e99b9e8039e783b0c39ace891bedaa6b63faf06"

  url "https://github.com/narasaka/kamui/releases/download/v#{version}/Kamui_#{version}_macos.zip"
  name "Kamui"
  desc "Menu bar app for mirroring a remote SSH host's loopback services"
  homepage "https://github.com/narasaka/kamui"

  depends_on formula: "narasaka/tap/kamui"
  depends_on macos: :ventura

  app "Kamui.app"

  uninstall quit: "io.github.narasaka.kamui"

  zap trash: "~/Library/Preferences/io.github.narasaka.kamui.plist"
end
