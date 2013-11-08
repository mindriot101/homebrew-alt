require 'formula'

class Ds9 < Formula
  homepage 'http://hea-www.harvard.edu/RD/ds9/site/Home.html'
  url 'http://hea-www.harvard.edu/RD/ds9/download/darwinmountainlion/ds9.darwinmountainlion.7.2.tar.gz'
  sha1 '4d7d17fd619ef5aa2fc14618811207faad797d76'

  depends_on :x11

  def install
    bin.install 'ds9', 'ds9.zip'
  end

  test do
    system 'ds9', '-version'
  end
end
