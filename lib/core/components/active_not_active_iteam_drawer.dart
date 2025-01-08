import 'package:arb_tasks/core/model/list_tiel_model.dart';
import 'package:arb_tasks/core/utiles/app_colors.dart';
import 'package:arb_tasks/core/utiles/app_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotActive extends StatefulWidget {
  const NotActive({
    super.key,
    required this.model,
  });

  final Listtilemodel model;

  @override
  State<NotActive> createState() => _NotActiveState();
}

class _NotActiveState extends State<NotActive> {
  @override
  Widget build(BuildContext context) {
    // الحصول على عرض الشاشة
    double screenWidth = MediaQuery.of(context).size.width;

    // تحديد إذا كان الجهاز هو تابلت بناءً على العرض
    bool isTablet = screenWidth > 600;

    return ListTile(
      leading: isTablet
          ? CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                widget.model.image,
                color: Colors.grey,
              ),
            )
          : SvgPicture.asset(
              widget.model.image,
              color: Colors.grey,
            ),
      title: Text(
        widget.model.data,
        style: AppStyles.f16600(context).copyWith(color: Colors.grey),
      ),
    );
  }
}

class Active extends StatelessWidget {
  const Active({
    super.key,
    required this.model,
  });

  final Listtilemodel model;

  @override
  Widget build(BuildContext context) {
    // الحصول على عرض الشاشة
    double screenWidth = MediaQuery.of(context).size.width;

    // تحديد إذا كان الجهاز هو تابلت بناءً على العرض
    bool isTablet = screenWidth > 600;

    return ListTile(
      leading: isTablet
          ? CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                model.image,
                color: AppColors.lightPrimaryColor,
              ),
            )
          : SvgPicture.asset(
              model.image,
              color: AppColors.lightPrimaryColor,
            ),
      title: Text(
        model.data,
        style: AppStyles.f16700(context)
            .copyWith(color: AppColors.lightPrimaryColor),
      ),
      trailing: Container(
        width: 3.7,
        color: AppColors.primaryColor,
      ),
    );
  }
}
