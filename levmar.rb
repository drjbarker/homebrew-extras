require "formula"

class Levmar < Formula
  homepage "http://users.ics.forth.gr/~lourakis/levmar/"
  url "http://users.ics.forth.gr/~lourakis/levmar/levmar-2.6.tgz"
  sha256 "3bf4ef1ea4475ded5315e8d8fc992a725f2e7940a74ca3b0f9029d9e6e94bad7"

  # depends_on "cmake" => :build
  depends_on "homebrew/boneyard/f2c" # if your formula requires any X11/XQuartz components

  def install
    system "make"
    lib.install "liblevmar.a"
    include.install "levmar.h"
  end
end
