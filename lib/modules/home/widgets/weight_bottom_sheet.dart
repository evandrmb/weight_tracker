import 'package:flutter/material.dart';
import 'package:weight_tracker/modules/home/widgets/select_date/select_date_widget.dart';
import 'package:weight_tracker/modules/home/widgets/weight_input/weight_input_widget.dart';

void showWeightBottomSheet(
  BuildContext context, {
  void Function(String _value) onChanged,
  void Function(DateTime weightDate) addWeight,
  TextEditingController controller,
}) {
  DateTime weightDate;

  final Function(DateTime _value) selectedDateCallBack = (DateTime _value) {
    weightDate = _value;
  };

  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Add new weight',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                WeightInputWidget(
                  onChanged: onChanged,
                  controller: controller,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SelectDateWidget(
                    selectedDate: selectedDateCallBack,
                  ),
                ),
                ButtonBar(
                  children: [
                    RaisedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        addWeight(weightDate);
                      },
                      child: Text('Add'),
                    ),
                  ],
                )
              ],
            )),
          ),
        );
      });
}
