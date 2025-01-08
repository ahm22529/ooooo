import 'package:arb_tasks/core/model/list_tiel_model.dart';
import 'package:arb_tasks/core/components/active_not_active_iteam_drawer.dart';
import 'package:flutter/material.dart';


class IteamDrwer extends StatelessWidget {
  const IteamDrwer({super.key, required this.model, required this.isactive});
  final Listtilemodel model;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: isactive ? Active(model: model) : NotActive(model: model),
    );
  }
}