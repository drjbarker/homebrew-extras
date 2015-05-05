require "formula"

class Gxhints < Formula
  homepage "http://sourceforge.net/projects/gxhints/"
  url "http://downloads.sourceforge.net/project/gxhints/gxhints/gxhints-1.0.3/gxhints-1.0.3.tar.gz"
  sha1 "4480ca1ec1ca6b5a6d434079f0ba466fd2896015"

  depends_on "batik"
  depends_on "ghostscript"
  depends_on "gnuplot"

  def install

    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
    bin.install "gxhconvert"
  end

  test do
    system "gxhconvert --check"
  end
end
