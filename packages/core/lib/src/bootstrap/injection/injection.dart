import 'package:core/core.dart';

part 'injection_impl.dart';

abstract class Injection {
  static final Injection I = _InjectionImplement();

  T get<T>([
    String? name,
  ]);

  bool isRegister<T>([
    String? instanceName,
  ]);

  void resetSingleton<T>([
    String? instanceName,
  ]);

  void registerFactory<T>({
    String? instanceName,
    required FactoryFunc<T> creator,
  });

  void registerSingleton<T>({
    String? instanceName,
    required FactoryFunc<T> creator,
  });
}
