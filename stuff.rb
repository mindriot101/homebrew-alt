class Stuff < Formula
  homepage ""
  url "http://www.astromatic.net/download/stuff/stuff-1.26.0.tar.gz"
  version "1.26.0"
  sha1 "53a9c860f1b7a44fec9aacdd8f6d404bf4bcde95"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
