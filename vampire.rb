require 'formula'

# The master branch doesn't compile due to clang incompatible flags
# so using the develop branch by default
class Vampire < Formula
  head "https://github.com/richard-evans/vampire.git", :branch => "develop"
  homepage 'http://vampire.york.ac.uk'

  def install
    system "make"
    bin.install "vampire"
  end
end
