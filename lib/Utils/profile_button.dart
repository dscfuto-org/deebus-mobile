import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Utils/app_icons_icons.dart';
import 'package:deebus/Utils/pulse_animator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileSaveButton extends StatelessWidget {
  ProfileSaveButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PulseAnimator(
      begin: 0.45,
      duration: const Duration(milliseconds: 1500),
      child: RawMaterialButton(
        fillColor: AppColors.deeBusPrimaryDark.shade300,
        splashColor: AppColors.deeBusPrimary.shade300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                AppIcons.floppy,
                color: AppColors.deeBusPrimary[100],
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Text(
                "UPDATE",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ],
          ),
        ),
        onPressed: onPressed,
        shape: StadiumBorder(),
      ),
    );
  }
}
