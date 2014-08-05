require "formula"

class Spglib < Formula
  homepage "http://spglib.sourceforge.net/"
  url "http://sourceforge.net/projects/spglib/files/spglib/spglib-1.6/spglib-1.6.1.tar.gz"
  sha1 "b32b512257e1a2129dd02903545223aea58c2d42"

  def install

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

end
