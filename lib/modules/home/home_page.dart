import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weight_tracker/modules/home/presenter/home_presenter.dart';
import '../home/widgets/weight_list/weight_list_widget.dart';

class HomePage extends StatelessWidget {
  final _presenter = Modular.get<HomePresenter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _presenter.addWeightBottomSheet(context);
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Weight Tracker'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: AnimatedBuilder(
            animation: _presenter,
            builder: (context, child) => RefreshIndicator(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: homeWidget(context),
                ),
                onRefresh: _presenter.reloadWeights),
          ),
        ));
  }

  Widget homeWidget(BuildContext context) {
    switch (_presenter.state) {
      case HomeState.Initial:
        return Container();

        break;
      case HomeState.Loading:
        return Center(child: CircularProgressIndicator());

        break;
      case HomeState.Sucess:
        return _presenter.registers.isNotEmpty
            ? _sucessWidgetWithRegisters(context)
            : Center(child: Text('Registre seu primeiro peso!'));

        break;
      case HomeState.Error:
        return Center(
          child: Text('Please file a issue'),
        );

        break;
      default:
        return Container();
    }
  }

  Widget _sucessWidgetWithRegisters(BuildContext context) =>
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width * 0.29,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Theme.of(context).accentColor),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text('Current Weight'),
                        ),
                        Text('${_presenter.currentWeight}')
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width * 0.29,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Theme.of(context).accentColor),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width * 0.29,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: WeightListWidget()),
          ],
        ),
      );
}
