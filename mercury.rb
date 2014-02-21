require "formula"

class Mercury < Formula
  homepage "http://www.arm.ac.uk/~jec/"
  url "http://star.arm.ac.uk/~jec/mercury/mercury6.tar"
  sha1 "183edc19e7d44e6cbd4bc4eb7cdf28ca036ad2f7"

  depends_on :fortran

  def install
    system "#{ENV.fc} #{ENV.fflags} -o mercury6 mercury6_2.for"
    system "#{ENV.fc} #{ENV.fflags} -o element6 element6.for"
    system "#{ENV.fc} #{ENV.fflags} -o close6 close6.for"

    %w{mercury6 element6 close6}.each do |binary|
      bin.install(binary)
    end

    share.install Dir['*.in']

    mv 'mercury6.man', 'mercury6.1'
    man1.install ['mercury6.1']
  end
end
