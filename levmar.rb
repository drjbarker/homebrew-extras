require "formula"

class Levmar < Formula
  homepage "http://users.ics.forth.gr/~lourakis/levmar/"
  url "http://users.ics.forth.gr/~lourakis/levmar/levmar-2.6.tgz"
  sha256 "8ccd493c93a5b032189175b174c2ad23a1636e64a839899ba2956cb6cd751683"

  # depends_on "cmake" => :build
  depends_on "homebrew/headonly/f2c" # if your formula requires any X11/XQuartz components

  def install
    system "make"
    lib.install "liblevmar.a"
    include.install "levmar.h"
  end
end
