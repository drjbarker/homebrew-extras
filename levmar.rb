require "formula"

class Levmar < Formula
  homepage "http://users.ics.forth.gr/~lourakis/levmar/"
  url "http://users.ics.forth.gr/~lourakis/levmar/levmar-2.6.tgz"
  sha1 "118bd20b55ab828d875f1b752cb5e1238258950b"

  # depends_on "cmake" => :build
  depends_on "homebrew/headonly/f2c" # if your formula requires any X11/XQuartz components

  def install
    system "make"
    lib.install "liblevmar.a"
    include.install "levmar.h"
  end
end
