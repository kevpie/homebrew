require 'formula'

class Skytools3 < Formula
  head 'https://github.com/kevpie/skytools.git'
  homepage ''

  depends_on 'autoconf'
# symlink autoconf
  depends_on 'python'
  depends_on 'postgresql'
  depends_on 'asciidoc'
  depends_on 'xmlto'
  depends_on 'gnu-sed'

  def install
    ENV['XMLTO']='xmlto'
    ENV['ASCIIDOC']='asciidoc' 
    system "make boot"
    system "./configure", "-v", "--with-asciidoc", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"

    system "make"
    system "make install"
  end

  def test
    # this will fail we won't accept that, make it test the program works!
    system "/usr/bin/false"
  end
end
