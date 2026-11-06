cask "kamui-app" do
  version "0.0.15"
  sha256 "bc24b680ca6c4e40215bc1d0fdc56a40b8f15a7c7078240daf10729c483e7df3"

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
