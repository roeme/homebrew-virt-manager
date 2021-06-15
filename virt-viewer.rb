class VirtViewer < Formula
  desc "App for virtualized guest interaction"
  homepage "https://virt-manager.org/"
  url "https://virt-manager.org/download/sources/virt-viewer/virt-viewer-10.0.tar.xz"
  sha256 "d23bc0a06e4027c37b8386cfd0286ef37bd738977153740ab1b6b331192389c5"

  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "meson" => :build

  depends_on "atk"
  depends_on "cairo"
  depends_on "gdk-pixbuf"
  depends_on "gettext"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "gtk-vnc"
  depends_on "hicolor-icon-theme"
  depends_on "libvirt"
  depends_on "libvirt-glib"
  depends_on "pango"
  depends_on "pygobject3"
  depends_on "shared-mime-info"
  depends_on "spice-gtk"
  depends_on "spice-protocol"

  # > 7.0, we need these:
  depends_on "librest"
  depends_on "libgovirt"

  
  # TODO: needs debug, 10.x crashes on big sur
  def install
    system "meson", "build"
    system "meson", "install", "--destdir #{prefix}"
  end

  def post_install
    # manual update of mime database
    system "#{Formula["shared-mime-info"].opt_bin}/update-mime-database", "#{HOMEBREW_PREFIX}/share/mime"
    # manual icon cache update step
    system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
  end

  test do
    system "#{bin}/virt-viewer", "--version"
  end
end
