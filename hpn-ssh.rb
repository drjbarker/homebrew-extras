require 'formula'

class HpnSsh < Formula
  homepage 'http://www.openssh.com/'
  url 'http://ftp5.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.6p1.tar.gz'
  version '6.6p1'
  sha1 'b850fd1af704942d9b3c2eff7ef6b3a59b6a6b6e'

  option 'with-brewed-openssl', 'Build with Homebrew OpenSSL instead of the system version'
  option 'with-keychain-support', 'Add native OS X Keychain and Launch Daemon support to ssh-agent'

  depends_on 'openssl' if build.with? 'brewed-openssl'
  depends_on 'autoconf' => :build if build.with? 'keychain-support'
  depends_on 'ldns' => :optional
  depends_on 'pkg-config' => :build if build.with? "ldns"

  conflicts_with 'openssh'

  patch do
    # Apply Kenny Root's revised version of Simon Wilkinson's gsskex patch (http://www.sxw.org.uk/computing/patches/openssh.html),
    # which has also been included in Apple's openssh for a while.
    # https://gist.github.com/kruton/8951373
    url 'https://gist.githubusercontent.com/tbb/9586715/raw/6b488018a76aa341a1f74e618663a1c52328bb12/openssh-6.6p1-gsskex-all-20130920.patch'
    sha1 '5dc6beacaef0d724dc654b9c237852d861e6bafb'
  end if build.with? 'keychain-support'

  patch do
    # The HPN-SSH patch installs over the Apple Keychain patch
    url 'http://downloads.sourceforge.net/project/hpnssh/HPN-SSH%2014.5%206.6p1/openssh-6.6p1-hpnssh14v5.diff.gz'
    sha1 '6ac45f7f4d61a8500fea100346febe00443c5b8b'
  end

  def install
    system "autoreconf -i" if build.with? 'keychain-support'

    if build.with? "keychain-support"
      ENV.append "CPPFLAGS", "-D__APPLE_LAUNCHD__ -D__APPLE_KEYCHAIN__"
      ENV.append "LDFLAGS", "-framework CoreFoundation -framework SecurityFoundation -framework Security"
    end

    args = %W[
      --with-libedit
      --prefix=#{prefix}
    ]

    args << "--with-ssl-dir=#{Formula.factory('openssl').opt_prefix}" if build.with? 'brewed-openssl'
    args << "--with-ldns" if build.with? "ldns"
    args << "--without-openssl-header-check"

    system "./configure", *args
    system "make"
    system "make install"
  end

  def caveats
    if build.with? "keychain-support" then <<-EOS.undent
        For complete functionality, please modify:
          /System/Library/LaunchAgents/org.openbsd.ssh-agent.plist

        and change ProgramArguments from
          /usr/bin/ssh-agent
        to
          #{HOMEBREW_PREFIX}/bin/ssh-agent

        After that, you can start storing private key passwords in
        your OS X Keychain.
      EOS
    end
  end
end
