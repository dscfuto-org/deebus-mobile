import 'dart:ui';

import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Models/country.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/app_icons_icons.dart';
import 'package:deebus/Utils/profile_button.dart';
import 'package:deebus/Utils/profile_input.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _containerHeight = 55.0;
  final _margin = EdgeInsets.only(left: 21.0, right: 8.0);
  bool _isDirty = false;
  bool _autoValidate = false;
  List<Country> _countries = Country.getCountries();
  List<DropdownMenuItem<Country>> _dropdownMenuItems;

  // Form Props
  String _firstName, _lastName, _email, _phoneNo;
  bool _subscribed = false;
  Country _selectedCountry;

  Map<String, String> data = Map.of({
    "firstname": "Brendan",
    "lastname": "Ejike",
    "email": "ejike.br@gmail.com",
    "phone": "+2348100395180"
  });

  void _onLanguageChange(Country value) {
    setState(() {
      _selectedCountry = value;
    });
  }

  void _onSubscribeChange(bool value) {
    setState(() {
      _subscribed = value;
    });
  }

  Future _formIsDirty(String oldValue, String newValue) async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _isDirty = oldValue != newValue;
      });
    });
  }

  void _validateAndSubmit() {
    if (_formKey.currentState.validate()) {
      print("First Name: $_firstName");
      print("Last Name: $_lastName");
      print("Email: $_email");
      print("Phone: $_phoneNo");
      return;
    }
    setState(() {
      _autoValidate = true;
    });
  }

  bool action() {
    return MediaQuery
        .of(context)
        .viewInsets
        .bottom == 0; // Keyboard is hidden
  }

  @override
  void initState() {
    _dropdownMenuItems = buildCountryMenu(_countries);
    _selectedCountry = _countries.firstWhere((country) => country.code == "US");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(color: AppColors.color4),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.color4,
            size: 35.0,
          ),
          onPressed: () => navigateBack(context),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            color: Colors.white10,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Text(
              "LOG OUT",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: RaisedButton(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Icon(
                        AppIcons.wallet,
                        color: AppColors().hexToColor("#682011"),
                        size: 23.7,
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "MY WALLET BALANCE",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.5,
                            fontFamily: 'Ubuntu'),
                      )
                    ],
                  ),
                  elevation: 0.0,
                  focusElevation: 0.0,
                  highlightElevation: 0.0,
                  color: AppColors().hexToColor("#cccccc"),
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side:
                      BorderSide(color: AppColors().hexToColor("#cccccc"))),
                  onPressed: () {},
                ),
              ),
            ),
            Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.7,
                  ),
                  Container(
                    height: _containerHeight,
                    alignment: Alignment.center,
                    child: ProfileInput(
                      text: data["phone"],
                      hint: "Phone",
                      enabled: true,
                      formType: TextInputType.phone,
                      validator: (phone) =>
                      phone.length > 14
                          ? 'Mobile Number must be of 11 digit'
                          : null,
                      onInputChanged: (value) {
                        _formIsDirty(data["phone"], value);
                        _phoneNo = value;
                      },
                    ),
                    margin: _margin,
                  ),
                  Divider(
                    height: 0,
                    indent: 21,
                    thickness: 0.7,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        flex: 12,
                        child: Container(
                          height: _containerHeight,
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(21.0, 0.0, 0.0, 0.0),
                          child: ProfileInput(
                            hint: "First Name",
                            text: data["firstname"],
                            validator: (String firstName) =>
                            firstName.isEmpty ? "Field is required!" : null,
                            onInputChanged: (value) {
                              _formIsDirty(data["firstname"], value);
                              _firstName = value;
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                            height: _containerHeight,
                            alignment: Alignment.center,
                            child: VerticalDivider(
                              width: 0.0,
                              thickness: 0.7,
                              indent: 10.0,
                              endIndent: 10.0,
                            )),
                        fit: FlexFit.tight,
                      ),
                      Flexible(
                        flex: 12,
                        child: Container(
                          height: _containerHeight,
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                          child: ProfileInput(
                            hint: "Last Name",
                            text: data["lastname"],
                            validator: (String lastName) =>
                            lastName.isEmpty ? "Field is required!" : null,
                            onInputChanged: (value) {
                              _formIsDirty(data["lastname"], value);
                              _lastName = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 0,
                    indent: 21,
                    thickness: 0.7,
                  ),
                  Container(
                    height: _containerHeight,
                    alignment: Alignment.center,
                    child: ProfileInput(
                      hint: "Email",
                      text: data["email"],
                      formType: TextInputType.emailAddress,
                      validator: (String email) {
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(email))
                          return "Enter a valid email!";
                        return null;
                      },
                      onInputChanged: (value) {
                        _formIsDirty(data["email"], value);
                        _email = value;
                      },
                    ),
                    margin: _margin,
                  ),
                  Divider(
                    height: 0.0,
                    thickness: 0.7,
                  ),
                  Container(
                    height: _containerHeight,
                    alignment: Alignment.center,
                    color: Colors.grey.shade200,
                    child: Text(
                      "Ride receipts will be sent to your email.",
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 17.0),
                    ),
                  ),
                  ListTile(
                    title: Align(
                      child: Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 17.4,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    subtitle: Text(
                      "Add Home",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300),
                    ),
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          AppIcons.home,
                          size: 27.0,
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          AppIcons.pencil,
                          size: 17.0,
                        ),
                      ],
                    ),
                    dense: true,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                    onTap: () {},
                  ),
                  Divider(
                    height: 0.0,
                    thickness: 0.7,
                  ),
                  ListTile(
                    title: Align(
                      child: Text(
                        "Work",
                        style: TextStyle(
                            fontSize: 17.4,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    subtitle: Text(
                      "Add Work",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300),
                    ),
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          AppIcons.briefcase,
                          size: 27.0,
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          AppIcons.pencil,
                          size: 17.0,
                        ),
                      ],
                    ),
                    dense: true,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                    onTap: () {},
                  ),
                  Divider(
                    height: 0.0,
                    thickness: 0.7,
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Divider(
                    height: 0.0,
                    thickness: 0.7,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(6.0, 5.0, 18.0, 5.0),
                    child: DropdownButton(
                      value: _selectedCountry,
                      items: _dropdownMenuItems,
                      onChanged: _onLanguageChange,
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Select Language",
                          style: TextStyle(
                            fontSize: 17.4,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Ubuntu",
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 23.0,
                      iconDisabledColor: Colors.grey,
                      iconEnabledColor: Colors.grey[700],
                      isExpanded: true,
                      elevation: 0,
                      underline: SizedBox(),
                    ),
                  ),
                  Divider(
                    height: 0.0,
                    indent: 21,
                    thickness: 0.7,
                  ),
                  CheckboxListTile(
                      value: _subscribed,
                      title: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          "DeeBus newsletter",
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Ubuntu"),
                        ),
                      ),
                      onChanged: _onSubscribeChange)
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
          visible: _isDirty,
          child: ProfileSaveButton(onPressed: _validateAndSubmit)),
    );
  }

  List<DropdownMenuItem<Country>> buildCountryMenu(List<Country> countries) {
    List<DropdownMenuItem<Country>> items = List();
    countries.forEach((country) =>
    {
      items.add(DropdownMenuItem(
        value: country,
        child: ListTile(
          leading: Flags.getMiniFlag(country.code, 20, null),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${country.language}",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ))
    });

    return items;
  }
}
