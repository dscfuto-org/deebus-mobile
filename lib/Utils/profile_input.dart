import 'package:deebus/Constants/AppColors.dart';
import 'package:flutter/material.dart';

class ProfileInput extends StatefulWidget {
  ProfileInput({this.hint = ""});

  String hint;

  @override
  _ProfileInputState createState() => _ProfileInputState();
}

class _ProfileInputState extends State<ProfileInput> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 2.0, color: AppColors.color4))),
      child: TextFormField(
        controller: _textController,
        maxLines: 1,
        textCapitalization: TextCapitalization.words,
        cursorColor: AppColors.color4,
        decoration: new InputDecoration(
            isDense: true,
            hintText: widget.hint,
            hasFloatingPlaceholder: true,
            enabled: true,
            border: InputBorder.none),
        keyboardType: TextInputType.text,
        style: new TextStyle(
          fontSize: 17.5,
          fontFamily: "Ubuntu",
        ),
        onChanged: (value) {},
      ),
    );
  }
}
