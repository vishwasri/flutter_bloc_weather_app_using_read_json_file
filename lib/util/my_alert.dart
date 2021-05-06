import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:hs_test/util/colors.dart';

class MyAlert {
  static void alertWarning(
      BuildContext context, String _title, String _description) {
    EdgeAlert.show(
      context,
      title: _title,
      description: _description,
      gravity: EdgeAlert.TOP,
      backgroundColor: LIGHT_ORANGE,
      icon: Icons.warning,
    );
  }

  static void alertError(
      BuildContext context, String _title, String _description) {
    EdgeAlert.show(
      context,
      title: _title,
      description: _description,
      gravity: EdgeAlert.TOP,
      backgroundColor: LIGHT_ORANGE,
      icon: Icons.warning,
    );
  }

  static void alertInfo(
      BuildContext context, String _title, String _description) {
    EdgeAlert.show(
      context,
      title: _title,
      description: _description,
      gravity: EdgeAlert.TOP,
      backgroundColor: LIGHT_ORANGE,
      icon: Icons.warning,
    );
  }

  static void alertSuccess(
      BuildContext context, String _title, String _description) {
    EdgeAlert.show(
      context,
      title: _title,
      description: _description,
      gravity: EdgeAlert.TOP,
      backgroundColor: DARK_GREEN,
      icon: Icons.done,
    );
  }
}
