import 'package:get_it/get_it.dart';
import 'package:movie_flutter_app/di/modules/data_modules.dart';
import 'package:movie_flutter_app/di/modules/repository_modules.dart';

/// Classe para componentização do sistema de injeção de dependências do app
///
/// Aqui, estou usando o GetIt, mas se necessário é fácil trocar esta implementação por
/// qualquer outra biblioteca como: provider, getX ou até um sistema próprio de injeção de dependência.
///
/// Neste caso, preferi por utilizar uma biblioteca pronta, porque ela tem algumas otimizações e ganhos
/// de performance em tempo de execução que são praticamente inviáveis de serem implementados manualmente.
abstract class Injector {
  T get<T extends Object>();

  void replace<T extends Object>(T instance);

  Future<void> initialize();
}

class _GetItImpl implements Injector {
  final getIt = GetIt.instance;

  _GetItImpl();

  /// Inicializa todas as dependências
  @override
  Future<void> initialize() async {
    await DataModules.setup(getIt);
    RepositoryModules.setup(getIt);
  }

  @override
  T get<T extends Object>() {
    return GetIt.I.get<T>();
  }

  @override
  void replace<T extends Object>(T instance) {
    GetIt.I.unregister<T>();
    GetIt.I.registerSingleton<T>(instance);
  }
}

final Injector injector = _GetItImpl();
