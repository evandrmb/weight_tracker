import 'package:flutter_modular/flutter_modular.dart';
import 'package:weight_tracker/modules/home/home_page.dart';

import 'presenter/home_presenter.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomePresenter()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => HomePage()),
      ];
}
