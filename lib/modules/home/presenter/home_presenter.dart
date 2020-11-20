import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weight_tracker/core/presenter/user_notifier.dart';
import 'package:weight_tracker/modules/auth/domain/entities/user.dart';
import 'package:weight_tracker/modules/home/data/fetch_weights_repository.dart';
import 'package:weight_tracker/modules/home/data/register_weight_repository.dart';
import 'package:weight_tracker/modules/home/models/weight.dart';
import 'package:weight_tracker/modules/home/models/weight_register.dart';
import 'package:weight_tracker/modules/home/widgets/weight_bottom_sheet.dart';

enum HomeState { Initial, Loading, Sucess, Error }

class HomePresenter extends ChangeNotifier {
  bool get isHomeInitial => HomeState.Initial == state;
  bool get isHomeLoading => HomeState.Loading == state;
  bool get isHomeSucess => HomeState.Sucess == state;
  bool get isHomeError => HomeState.Error == state;

  double get currentWeight =>
      registers.isNotEmpty ? registers.last.weight.value : 0.00;

  final RegisterWeightRepository _registerWeightRepository;
  final FetchWeightsRepository _fetchWeightsRepository;

  HomePresenter(this._registerWeightRepository, this._fetchWeightsRepository) {
    fetchWeights();
  }

  Future<void> reloadWeights() => Future.value(() => fetchWeights());

  void fetchWeights() async {
    emit(HomeState.Loading);
    final user = Modular.get<UserNotifier>().value;

    final result = await _fetchWeightsRepository(user);

    result.fold((l) {
      print(l);
      emit(HomeState.Error);
    }, (r) {
      registers = r;
      emit(HomeState.Sucess);
    });
  }

  void emit(HomeState _state) {
    state = _state;
    notifyListeners();
  }

  List<WeightRegister> registers = [];
  final TextEditingController weightController = TextEditingController();
  HomeState state = HomeState.Initial;

  void addWeightBottomSheet(BuildContext context) {
    showWeightBottomSheet(context,
        addWeight: addWeight, controller: weightController);
  }

  void addWeight(DateTime weightDate) {
    final weight = weightController.text;
    final user = Modular.get<UserNotifier>().value;
    final now = DateTime.now();

    final option = createWeight(double.parse(weight));

    option.fold(
      () => print(
          'Are you sure you have more than 600 Kg? The heaviest human registered in Guinness Records had 600Kg!'),
      (currentWeight) => _registerWeight(
          user, WeightRegister(currentWeight, weightDate, now, now)),
    );
  }

  void _registerWeight(User user, WeightRegister register) async {
    state = HomeState.Loading;
    notifyListeners();

    final result = await _registerWeightRepository(user, register);

    result.fold((l) {
      print(l);
      state = HomeState.Error;
    }, (_weightRegister) {
      registers.add(_weightRegister);
      state = HomeState.Sucess;
    });
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    weightController.dispose();
  }
}
