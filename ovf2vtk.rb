require "formula"

class Ovf2vtk < Formula
  homepage "http://www.southampton.ac.uk/~fangohr/software/ovf2vtk/"
  url "http://www.southampton.ac.uk/~fangohr/software/ovf2vtk/dist/source/ovf2vtk-0.1.23.tar.gz"
  sha1 "5d0ca1d8dda3f2091113461b202667e7a92d72f5"

  depends_on 'pyvtk' => :python

  def install

    # distutils rewrites the shebang to a definate python rather
    # than /usr/bin/env python. This seems to get set to the system
    # python (/usr/bin/python) not the brewed python, so we force
    # the brewed python to be used.
    system "python", "setup.py",
            "build",
            "--executable=#{HOMEBREW_PREFIX}/bin/python"

    system "python", "setup.py",
          "install",
          "--prefix=#{prefix}"
  end
end
