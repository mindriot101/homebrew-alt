class Jktebop < Formula
  homepage "http://www.astro.keele.ac.uk/jkt/codes/jktebop.html"
  url "http://www.astro.keele.ac.uk/jkt/codes/jktebop-v34.tgz"
  sha1 "ea08d44eafb337e7ad0aab06197614ffd209099c"

  option "with-examples", "Install the examples into share/#{name}"

  depends_on :fortran

  def install
    system "#{ENV.fc} -O2 -o #{name} #{name}.f"
    bin.install name

    if build.with? "examples"
      mkdir "#{name}" do
        %w{dat out fit in par}.each do |ext|
          mv Dir.glob("../*.#{ext}"), '.'
        end
      end
      share.install "#{name}"
    end
  end
end
