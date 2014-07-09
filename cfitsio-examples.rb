require "formula"

class CfitsioExamples < Formula
  homepage "http://heasarc.gsfc.nasa.gov/docs/software/fitsio/cexamples.html"
  url "http://heasarc.gsfc.nasa.gov/docs/software/fitsio/cexamples/cexamples.tar"
  sha1 "4e153e7261e3ee1f64ec249446f983e61f93e8bc"
  version "1.0.0"

  depends_on "cfitsio"

  def install
    Dir["*.c"].each do |fname|
      bin_name = File.basename(fname, File.extname(fname))
      system "gcc #{fname} -lcfitsio -o #{bin_name} -O2"
      bin.install bin_name
    end
  end
end
