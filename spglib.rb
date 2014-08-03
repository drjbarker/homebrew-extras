require "formula"

class Spglib < Formula
  homepage "http://spglib.sourceforge.net/"
  url "http://sourceforge.net/projects/spglib/files/spglib/spglib-1.6/spglib-1.6.0.tar.gz/download"
  sha1 "371fe08aa9de04aec1df929f2fca66e02b0b81fa"

  def install

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

end
