enum AppRoutes {
  home('/home'),
  assetDetail('assetDetail'),
  profile('/profile'),
  transactions('/transactions');

  const AppRoutes(this.path);
  final String path;
}
