enum AppRoutes {
  home('/home'),
  assetDetail('assetDetail'),
  profile('/profile');

  const AppRoutes(this.path);
  final String path;
}
