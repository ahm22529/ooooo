// import 'package:flutter/material.dart';
// import 'package:oemor/core/utils/app_colors.dart';

// class CustomCheckbox extends StatelessWidget {
//   final bool value;
//   final ValueChanged<bool?> onChanged;

//   const CustomCheckbox({
//     Key? key,
//     required this.value,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onChanged(!value);
//       },
//       child: Container(
//         width: 24.0,
//         height: 24.0,
//         decoration: BoxDecoration(
//           color: value ? AppColors.primaryColor : Colors.white,
//           border: Border.all(
//             color: AppColors.primaryColor,
//           ),
//         ),
//         child: value
//             ? Center(
//                 child: Container(
//                   width: 14.0,
//                   height: 14.0,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: AppColors.primaryColor,
//                       style: BorderStyle.solid,
//                     ),
//                   ),
//                 ),
//               )
//             : null,
//       ),
//     );
//   }
// }
import 'package:arb_tasks/core/utiles/app_colors.dart';
import 'package:flutter/material.dart';



class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 25.0,
        padding: const EdgeInsets.all(2),
        height: 25.0,
        decoration: BoxDecoration(
          color: value ? AppColors.whiteColor : Colors.white,
          border: Border.all(color: AppColors.bgGray, width: 1.5),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: value
            ? Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(3)),
                child: const Icon(
                  Icons.done,
                  size: 15,
                  color: AppColors.whiteColor,
                ),
              )
            : Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(3)),
              ),
      ),
    );
  }
}
