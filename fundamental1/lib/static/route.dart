enum Navigation{
  home("/"),
  detail("/detail");

  const Navigation(this.path);
  final String path;
}

//ini seperti ini:
// class NavigationRoute {
//   final String path;
//   const NavigationRoute._(this.path);

//   static const homeRoute = NavigationRoute._("/");
//   static const detailRoute = NavigationRoute._("/detail");
// }