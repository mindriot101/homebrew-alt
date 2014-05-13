require "formula"

class Syncthing < Formula
  homepage "http://syncthing.net/"
  url "https://github.com/calmh/syncthing/releases/download/v0.8.5/syncthing-darwin-amd64-v0.8.5.tar.gz"
  sha1 "4610588a07cc45247108d353a4babfb7400ec9bf"

  def install
    bin.install "syncthing"
  end

  test do
    assert_equal "v#{version}", `#{bin}/syncthing -version`.strip.split[1]
  end
end
