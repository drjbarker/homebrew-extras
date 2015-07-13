require "formula"

class Spglib < Formula
  homepage "http://spglib.sourceforge.net/"
  url "http://sourceforge.net/projects/spglib/files/spglib/spglib-1.8/spglib-1.8.1.tar.gz"
  sha1 "fd82be485ca2a77f9a9c3ff4b75e3ae4547270c4"

  def install

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

end
