import 'package:deebus/Constants/AppColors.dart';
import 'package:flutter/material.dart';

class ProfileInput extends StatefulWidget {
  ProfileInput({this.hint = "",
    this.text = "",
    this.enabled = true,
    this.formType = TextInputType.text,
    this.validator,
    this.onSaved,
    this.onInputChanged});

  @required
  final String hint;
  final String text;
  final bool enabled;
  final TextInputType formType;
  @required
  final Function validator;
  @required
  final Function onSaved;
  @required
  final Function onInputChanged;

  @override
  _ProfileInputState createState() => _ProfileInputState();
}

class _ProfileInputState extends State<ProfileInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      textCapitalization: TextCapitalization.words,
      initialValue: widget.text,
      cursorColor: AppColors.color4,
      enabled: widget.enabled,
      validator: widget.validator,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        isDense: true,
        hasFloatingPlaceholder: true,
        hintText: widget.hint,
        enabled: widget.enabled,
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2.0, color: AppColors.color4, style: BorderStyle.solid)),
      ),
      keyboardType: widget.formType,
      style: new TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        fontFamily: "Ubuntu",
      ),
      onChanged: widget.onInputChanged,
      toolbarOptions: ToolbarOptions(
        cut: false,
        copy: true,
        paste: true,
        selectAll: true,
      ),
    );
  }
}
