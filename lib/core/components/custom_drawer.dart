import 'package:arb_tasks/core/model/list_tiel_model.dart';
import 'package:arb_tasks/core/utiles/app_image.dart';
import 'package:arb_tasks/core/components/active_not_active_iteam_drawer.dart';
import 'package:arb_tasks/core/components/custom_list_titel.dart';
import 'package:arb_tasks/core/components/drawer_iteam_list_view.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _BodyContinerState();
}

class _BodyContinerState extends State<CustomDrawer> {
  // ignore: non_constant_identifier_names
  List Iteam = [
    Listtilemodel(data: "Dashboard", image: "assets/svg/Frame 16484.svg"),
    Listtilemodel(data: "My Transaction", image: "assets/svg/profit 02.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CustomListtile(
              data: 'Lekan Okeowo',
              data1: 'demo@gmail.com',
              image: "assets/svg/profit 02.svg",
            ),
          ),
          drweriteamListview(Iteam: Iteam),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(
                    child: SizedBox(
                  height: 20,
                )),
                NotActive(
                    model: Listtilemodel(
                        data: "seting", image: AppImage.activemet)),
                NotActive(
                    model: Listtilemodel(
                        data: "log out", image: AppImage.activedetail))
              ],
            ),
          )
        ],
      ),
    );
  }
}
