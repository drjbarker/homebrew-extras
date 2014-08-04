require "formula"

class Pyvtk < Formula
  homepage "https://pypi.python.org/pypi/PyVTK"
  url "https://pypi.python.org/packages/source/P/PyVTK/PyVTK-0.4.85.tar.gz"
  sha1 "958369026eada0be13a4cda4629355acf4e878e6"

  depends_on :python

  def install
    system "python", "setup.py",
            "install",
            "--prefix=#{prefix}"
  end
end
