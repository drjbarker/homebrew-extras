require "formula"

class Pyvtk < Formula
  homepage "https://pypi.python.org/pypi/PyVTK"
  url "https://pypi.python.org/packages/source/P/PyVTK/PyVTK-0.4.85.tar.gz"
  sha256 "4f971e21eb73b44fd4dd52bed1aeea7879e0d9e8debfded651bb8fc9c80033e2"

  depends_on :python

  def install
    system "python", "setup.py",
            "install",
            "--prefix=#{prefix}"
  end
end
