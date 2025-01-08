// ignore: file_names
import 'package:flutter/material.dart';

class AdaptiveUi extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const AdaptiveUi(
      {super.key,
      required this.MobileLauyOut,
      // ignore: non_constant_identifier_names
      required this.TabletLayOut,
      // ignore: non_constant_identifier_names
      required this.DeskTopLayOut});
  // ignore: non_constant_identifier_names
  final WidgetBuilder MobileLauyOut, TabletLayOut, DeskTopLayOut;
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    return LayoutBuilder(builder: (context, Constraints) {
      if (Constraints.maxWidth < 800) {
        return MobileLauyOut(context);
      } else if (Constraints.maxWidth < 1200) {
        return TabletLayOut(context);
      } else {
        return DeskTopLayOut(context);
      }
    });
  }
}
