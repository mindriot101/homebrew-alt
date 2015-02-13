class Skymaker < Formula
  homepage ""
  url "http://www.astromatic.net/download/skymaker/skymaker-3.10.5.tar.gz"
  version "3.10.5"
  sha1 "0e11eb66f5d23f12cf6dc967ef4ade5328a662ca"

  depends_on "fftw"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "sky -h"
  end
end
