import 'package:core/core.dart';

abstract class Env {
  abstract final Host appHost;
  abstract final Flavor appFlavor;

  abstract final bool appLogger;
  abstract final String appLocale;
  abstract final String appCurrency;
  abstract final String appTimeFormat;

  abstract final Map<String, String> appHosts;
  abstract final Map<String, dynamic> appExtras;

  String getHost(String key) {
    return appHosts[key]!;
  }

  TResult getExtra<TResult>(String key) {
    return appExtras[key] as TResult;
  }
}

class DevEnv extends Env {
  @override
  Host appHost = Host.test;

  @override
  Flavor appFlavor = Flavor.dev;

  @override
  bool appLogger = true;

  @override
  String appLocale = "vi_VN";

  @override
  String appCurrency = "VND";

  @override
  String appTimeFormat = "dd/MM/yyyy";

  @override
  Map<String, String> appHosts = {};

  @override
  Map<String, dynamic> appExtras = {};
}
