import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateWidget extends StatefulWidget {
  final Function(DateTime _value) selectedDate;

  const SelectDateWidget({Key key, @required this.selectedDate})
      : super(key: key);

  @override
  _SelectDateWidgetState createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  DateTime _selectedDate;

  Future<DateTime> selectDate(BuildContext context) => showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 7)),
      lastDate: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final date = await selectDate(context);
        if (date != null) {
          setState(() {
            _selectedDate = date;
            widget.selectedDate(_selectedDate);
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey[350],
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Text(_selectedDate != null
                ? DateFormat('yyyy-MM-dd').format(_selectedDate)
                : 'Select a date'),
            Icon(Icons.calendar_today),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
