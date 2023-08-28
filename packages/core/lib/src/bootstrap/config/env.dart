import 'package:core/core.dart';

abstract class Env {
  abstract final Host host;
  abstract final Deploy deploy;

  abstract final String appLocale;
  abstract final String appLogger;
  abstract final String appCurrency;
  abstract final String appInstalled;
  abstract final String appDateTimeFormat;

  abstract final Map<String, String> hosts;
  abstract final Map<String, dynamic> extras;
}
