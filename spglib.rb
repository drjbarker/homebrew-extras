class Spglib < Formula
  desc "C library for finding and handling crystal symmetries"
  homepage "http://spglib.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/spglib/spglib/spglib-1.7/spglib-1.7.4.tar.gz"
  sha256 "a396bf623d2c7bebbc2fec05bfa4e801191d9c8ceb28c16c47d9f8e247896c30"
  head "https://github.com/atztogo/spglib.git"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end