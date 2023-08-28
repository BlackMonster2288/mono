class Host {
  const Host();

  bool get isLive => this is HostLive;

  bool get isTest => this is HostTest;
}

class HostLive extends Host {
  const HostLive();
}

class HostTest extends Host {
  const HostTest();
}
