require "formula"

class Gxhints < Formula
  homepage "http://sourceforge.net/projects/gxhints/"
  url "http://downloads.sourceforge.net/project/gxhints/gxhints/gxhints-1.1.5/gxhints-1.1.5.tar.gz"
  sha256 "b436fbcda86e6a8466a67296f3ab14dfb79f4a78e24db3107f16f74915fbad30"

  depends_on "batik"
  depends_on "ghostscript"
  depends_on "gnuplot"

  def install

    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
    system "mv", "gxhconvert.pl", "gxhconvert"
    bin.install "gxhconvert"
  end

  test do
    system "gxhconvert --check"
  end
end
