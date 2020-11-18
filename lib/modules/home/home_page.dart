import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weight_tracker/modules/home/presenter/home_presenter.dart';

class HomePage extends StatelessWidget {
  final _presenter = Modular.get<HomePresenter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Weight Tracker'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
