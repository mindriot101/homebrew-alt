require 'formula'

class Qstats < Formula
  homepage 'http://www.onthelambda.com/2013/11/05/qstats-quick-and-dirty-statistics-tool-for-the-unix-pipeline/'
  url 'http://www.onthelambda.com/wp-content/uploads/2013/11/qstats-1.0.tar.gz'
  sha1 '3bed257a5e2a3400c168a2fe3d00582882ac0bc1'

  def install
    system "make", "install", "INSTALLPREFIX=#{prefix}"
  end
end
