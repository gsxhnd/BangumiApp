class _Config {
  final isProd = bool.fromEnvironment('dart.vm.product');

  String get appName => isProd ? 'App' : 'App (Debug)';

  String get redirectUri => isProd ? 'http://bangumi.gsxhnd.xyz' : 'http://192.168.4.238:8080/wait_login';
  String get appId => isProd ? "":"bgm13805e31595be3d6d";
}

final config = _Config();