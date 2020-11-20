import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/modules/home/presenter/home_presenter.dart';

class WeightListWidget extends StatelessWidget {
  final _presenter = Modular.get<HomePresenter>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _presenter.registers.length,
      itemBuilder: (context, index) {
        return Dismissible(
            confirmDismiss: (direction) {
              if (direction == DismissDirection.startToEnd) {
                return confirmDialog(context, true);
              } else {
                return confirmDialog(context, false);
              }
            },
            secondaryBackground:
                Container(child: Icon(Icons.edit), color: Colors.green),
            background: Container(child: Icon(Icons.delete), color: Colors.red),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                print('Deslizou delete');
              } else {}
            },
            key: Key('$index'),
            child: ListTile(
              title: Text('${_presenter.registers[index].weight.value} Kg'),
              subtitle: Text(
                  '${DateFormat().format(_presenter.registers[index].weightDate)}'),
            ));
      },
    );
  }

  Future<bool> confirmDialog(BuildContext context, bool delete) => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Do you really want to ${delete ? 'delete' : 'edit'} this weight?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 48.0),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RaisedButton(
                        onPressed: () {},
                        child: Text('Cancel'),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text('${delete ? 'Delete' : 'Edit'}'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
}
