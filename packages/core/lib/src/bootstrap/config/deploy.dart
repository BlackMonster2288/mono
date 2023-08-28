abstract class Deploy {
  const Deploy();

  bool get isDev => this is DeployDev;

  bool get isProd => this is DeployProd;
}

class DeployDev extends Deploy {
  const DeployDev();
}

class DeployProd extends Deploy {
  const DeployProd();
}
