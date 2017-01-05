class Spglib < Formula
  desc "C library for finding and handling crystal symmetries"
  homepage "https://atztogo.github.io/spglib/"
  head "https://github.com/atztogo/spglib.git"
  url "https://github.com/atztogo/spglib.git",:tag => "v1.9.9"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build

  def install
    system "aclocal"
    system "autoheader"
    system "glibtoolize"
    system "touch INSTALL NEWS README AUTHORS"
    system "automake -acf"
    system "autoconf"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end