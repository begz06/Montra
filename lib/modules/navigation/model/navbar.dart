class NavBar {
  final int id;
  final String icon;
  final String? label;
  final String? activeIcon;
  final String? networkIcon;

  const NavBar({
    required this.id,
    required this.label,
    required this.icon,
     this.networkIcon,
     this.activeIcon,
  });
}
