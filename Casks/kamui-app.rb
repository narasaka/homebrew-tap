cask "kamui-app" do
  version "0.0.14"
  sha256 "0b358d7bd79ae8539b5e0dd38cc0c1c873764d11bf94c043740a15792535d489"

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
