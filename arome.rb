class Arome < Formula
  homepage ""
  url "http://www.astro.up.pt/resources/arome/files/arome-1.0.0.tar.gz"
  version "1.0.0"
  sha1 "ee33905989db392c037af3a3a7d8a5f4c8d89dcd"

  depends_on :fortran

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-fortran=no"
    system "make", "install"
  end
end
