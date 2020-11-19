import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weight_tracker/modules/home/data/register_weight_repository.dart';
import 'package:weight_tracker/modules/home/home_page.dart';

import 'data/fetch_weights_repository.dart';
import 'presenter/home_presenter.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FetchWeightsRepository(Modular.get<FirebaseFirestore>())),
        Bind((i) => RegisterWeightRepository(Modular.get<FirebaseFirestore>())),
        Bind((i) => HomePresenter(i(), i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => HomePage()),
      ];
}
