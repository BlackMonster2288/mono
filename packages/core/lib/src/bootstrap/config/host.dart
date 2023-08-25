class TestHost extends Host {
  const TestHost._();
}

class StagHost extends Host {
  const StagHost._();
}

class LiveHost extends Host {
  const LiveHost._();
}

abstract class Host {
  const Host();

  static const Host test = TestHost._();

  static const Host stag = StagHost._();

  static const Host live = LiveHost._();

  bool get isTest => this is TestHost;

  bool get isStag => this is StagHost;

  bool get isLive => this is LiveHost;
}
