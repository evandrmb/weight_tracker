import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightInputWidget extends StatefulWidget {
  final Function(String value) onChanged;
  final TextEditingController controller;

  const WeightInputWidget(
      {Key key, @required this.onChanged, @required this.controller})
      : super(key: key);
  @override
  _WeightInputWidgetState createState() => _WeightInputWidgetState();
}

class _WeightInputWidgetState extends State<WeightInputWidget> {
  FocusNode node = FocusNode();

  @override
  void initState() {
    node.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: node,
      decoration: InputDecoration(
        labelText: 'Weight',
        filled: true,
        fillColor: Colors.grey[350],
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: node.hasFocus ? BorderStyle.solid : BorderStyle.none,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        FilteringTextInputFormatter.deny(RegExp(r'[A-Za-z]')),
      ],
    );
  }
}
