class Libgovirt < Formula
  desc "GoVirt is a GObject wrapper for the oVirt REST API"
  homepage "https://gitlab.gnome.org/GNOME/libgovirt"
  url "https://gitlab.gnome.org/GNOME/libgovirt/-/archive/v0.3.8/libgovirt-v0.3.8.tar.gz"
  sha256 "a3f00dd14553d4c85d1a1b31a8182642b5ead66314a1ed137c2242d46ecb5f32"
  license "GPL 2.1"

  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build

  depends_on "gettext"
  depends_on "glib"
  depends_on "gobject-introspection"
  depends_on "librest"

  # darwin's linker doesn't understand --version-script. google-fu reveals
  # that in most cases this flag is simply commented out then.
  patch :DATA

  def install
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # TODO: create these
    system "true"
  end
end
__END__
--- a/govirt/Makefile.am	2021-02-24 14:45:49.000000000 +0100
+++ b/govirt/Makefile.am.patched	2021-06-15 22:28:43.000000000 +0200
@@ -96,8 +96,8 @@
 libgovirt_la_LDFLAGS =						\
 	-version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE)	\
 	-export-dynamic						\
-	-no-undefined						\
-	-Wl,--version-script=$(srcdir)/govirt.sym
+	-no-undefined						#\
+	#-Wl,--version-script=$(srcdir)/govirt.sym
 
 libgovirt_la_CFLAGS =						\
 	$(WARNINGFLAGS_C)
