part of 'injection.dart';

const int _NOT_FIND_ITEM_INDEX = -1;

class _ServiceObject<T> {
  final String? instanceName;
  final FactoryFunc<T> creator;

  _ServiceObject({
    this.instance,
    this.instanceName,
    required this.creator,
  });

  T? instance;

  T getInstance() {
    return creator();
  }

  void resetInstance() {
    instance = creator();
  }

  bool compareKey<TN>(String? name) {
    final otherName = "$TN - $name";
    final currentKey = "$T - $instanceName";

    return otherName == currentKey;
  }
}

class _FactoryService<T> extends _ServiceObject<T> {
  _FactoryService({
    super.instanceName,
    required super.creator,
  });

  @override
  T getInstance() {
    return creator();
  }
}

class _SingletonService<T> extends _ServiceObject<T> {
  _SingletonService({
    super.instanceName,
    required super.creator,
  });

  @override
  T getInstance() {
    return instance ??= creator();
  }
}

class _InjectionImplement extends Injection {
  final List<_ServiceObject> _services = [];

  int _getServiceIndex<T>(String? name) {
    final itemCount = _services.length;

    for (int index = 0; index < itemCount; index++) {
      if (_services[index].compareKey<T>(name)) {
        return index;
      }
    }

    return _NOT_FIND_ITEM_INDEX;
  }

  // ======================================================================== //

  T get<T>([
    String? name,
  ]) {
    final serviceIndex = _getServiceIndex<T>(name);

    if (serviceIndex != _NOT_FIND_ITEM_INDEX) {
      final serviceItem = _services[serviceIndex];

      return serviceItem.getInstance() as T;
    } else {
      throw Exception(
        "$T - $name Not register",
      );
    }
  }

  bool isRegister<T>([
    String? instanceName,
  ]) {
    final serviceIndex = _getServiceIndex<T>(instanceName);

    if (serviceIndex != _NOT_FIND_ITEM_INDEX) {
      return true;
    }

    return false;
  }

  void resetSingleton<T>([
    String? instanceName,
  ]) {
    var serviceIndex = _getServiceIndex<T>(instanceName);
    if (serviceIndex != _NOT_FIND_ITEM_INDEX) {
      _services[serviceIndex].resetInstance();
    }
  }

  void registerFactory<T>({
    String? instanceName,
    required FactoryFunc<T> creator,
  }) {
    var serviceIndex = _getServiceIndex<T>(instanceName);
    if (serviceIndex == _NOT_FIND_ITEM_INDEX) {
      _services.add(
        _FactoryService<T>(
          creator: creator,
          instanceName: instanceName,
        ),
      );
    }
  }

  void registerSingleton<T>({
    String? instanceName,
    required FactoryFunc<T> creator,
  }) {
    var serviceIndex = _getServiceIndex<T>(instanceName);
    if (serviceIndex == _NOT_FIND_ITEM_INDEX) {
      _services.add(
        _SingletonService<T>(
          creator: creator,
          instanceName: instanceName,
        ),
      );
    }
  }
}
