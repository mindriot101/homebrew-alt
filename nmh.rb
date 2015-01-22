class Nmh < Formula
  homepage ""
  url "http://download.savannah.nongnu.org/releases/nmh/nmh-1.6.tar.gz"
  version "1.6"
  sha1 "d424a7520c85abfdbd492f70cdae7fce51a88a7f"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
