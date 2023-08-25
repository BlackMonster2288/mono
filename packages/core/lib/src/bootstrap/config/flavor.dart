class DevFlavor extends Flavor {
  const DevFlavor._();
}

class PluFlavor extends Flavor {
  const PluFlavor._();
}

class ProFlavor extends Flavor {
  const ProFlavor._();
}

abstract class Flavor {
  const Flavor();

  static const Flavor dev = DevFlavor._();

  static const Flavor plu = PluFlavor._();

  static const Flavor pro = ProFlavor._();

  bool get isDev => this is DevFlavor;

  bool get isPlu => this is PluFlavor;

  bool get isPro => this is ProFlavor;
}
