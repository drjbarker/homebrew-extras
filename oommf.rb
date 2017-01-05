require "formula"

class Oommf < Formula
  url "http://math.nist.gov/oommf/dist/oommf12a5bis_20120928.tar.gz"
  homepage " http://math.nist.gov/oommf"
  sha256 "7a7e33bc49618e3c24e05de408b5b70a3908a1e0e233c5f6e69d6aa46d1c01a0"
  version "1.2a5"

  # remove optimization flags which are not supported by clang
  patch :p0, :DATA

  def install
    system "tclsh oommf.tcl +platform"
    system "tclsh oommf.tcl pimake"
    prefix.install "oommf.tcl"
    (bin/"oommf").write exec_script
    prefix.install Dir["app"]
    prefix.install Dir["pkg"]
    prefix.install Dir["config"]
    doc.install Dir["doc/*"]
  end
end

def exec_script; <<-EOS.undent
  #!/bin/sh
  tclsh #{prefix}/oommf.tcl "$@"
  EOS
end

def caveats; <<-EOS.undent
  OOMMF has been installed with a wrapper script. 
  To run use 'oommf [args...]' on the command line.
  EOS
end


__END__
--- config/platforms/gcc-support.tcl	2011-03-22 09:42:06.000000000 +0900
+++ config/platforms/gcc-support-edit.tcl	2014-07-29 19:49:11.000000000 +0900
@@ -75,8 +75,6 @@
    # Optimization options
    set opts [list -O2 -ffast-math]
    if {$verA>=3} {
-      lappend opts -frename-registers
-
       # Docs say -fstrict-aliasing is in 2.95.  I can't find docs
       # for 2.8, but one extant installation I have (on SGI) doesn't
       # recognize -fscrict-aliasing.  To be safe, just require 3.x.
@@ -86,10 +84,6 @@
       if {$verA!=4 || $verB>0} {
          lappend opts -fstrict-aliasing
       }
-
-      if {$verA>=4 || $verB>=4} {
-         lappend opts -fweb
-      }
    }
 
    # Frame pointer: Some versions of gcc don't handle exceptions
