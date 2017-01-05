require "formula"

class Gxhints < Formula
  homepage "http://sourceforge.net/projects/gxhints/"
  url "http://downloads.sourceforge.net/project/gxhints/gxhints/gxhints-1.1.5/gxhints-1.1.5.tar.gz"
  sha256 "380eac9c19e6be29da75339c8d892d17712f41e4ac611b4de1f498c52bb27942"

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
