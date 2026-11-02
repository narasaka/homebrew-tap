cask "kamui-app" do
  version "0.0.13"
  sha256 "59ce05e8fa74c1b9c2684361f9c002864b8105c92d976f4026b7b4c9ce72bf9a"

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
