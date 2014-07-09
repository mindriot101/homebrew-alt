require 'formula'

class Ds9 < Formula
  homepage 'http://hea-www.harvard.edu/RD/ds9/site/Home.html'

  if MacOS.version >= :mountain_lion
    url 'http://hea-www.harvard.edu/RD/ds9/download/darwinmountainlion/ds9.darwinmountainlion.7.2.tar.gz'
    sha1 '4d7d17fd619ef5aa2fc14618811207faad797d76'
  elsif MacOS.version == :lion
    url 'http://ds9.si.edu/download/darwinlion/ds9.darwinlion.7.2.tar.gz'
    sha1 '8500b3ec15c91c83e126dfb1857e0b13b0e7ab9e'
  else
    url 'http://ds9.si.edu/download/darwinsnowleopard/ds9.darwinsnowleopard.7.2.tar.gz'
    sha1 'b6a1ef79812f8a7d2bbccd9e3e5640d1e60b2fa7'
  end

  depends_on :x11

  def install
    bin.install 'ds9', 'ds9.zip'
  end

  test do
    system 'ds9', '-version'
  end
end
