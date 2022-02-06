
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:web_admin_chat_app/controllers/dashboard_controller.dart';
import 'package:web_admin_chat_app/utils/app_colors.dart';
import 'package:web_admin_chat_app/view/app_header.dart';
import 'package:web_admin_chat_app/widgets/card_tile.dart';


class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return GetBuilder<DashBoardController>(
        init: DashBoardController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: AppColors.backgroundcolor,
            body: _.isLoading
                ? Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: AppColors.bluecolor,
                          size: 50,
                        ),
                      ),
                    ),
                  )
                : Column(children: [
                    Header(),
                     Row(

                            children: const[
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  'DashBoard',
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 170),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CardTile(
                            cardTitle: 'Users',
                            icon: Icons.account_balance_outlined,
                            iconBgColor: Colors.indigo,
                            mainText: '${_.usersList.length}',
                            subText: 'Total Users',
                          ),
                          // statsContainer(
                          //     context, 'Total Nurses Accounts', '${_.nurseslist.length}'),
                          CardTile(
                            cardTitle: 'Admin',
                            icon: Icons.account_balance_wallet_outlined,
                            iconBgColor: Colors.red,
                            mainText: '${_.adminList.length}',
                            subText: 'Total Admin',
                          ),


                           CardTile(
                            cardTitle: 'Signal Information',
                            icon: Icons.account_balance_outlined,
                            iconBgColor: Colors.indigo,
                            mainText: '${_.titleList.length}',
                            subText: 'Total Singal Information',
                          ),
                          // statsContainer(
                          //     context, 'Total Non-Corporate Accounts', '${_.nonCorporatelist.length}'),
                         
                          // statsContainer(
                          //     context, 'Total Session', '${_.sumTwo(_.sessionlist)}')
                        ],
                      ),
                    ),
                   
                  ],
            ),
          );
        });
  }

  Widget statsContainer(BuildContext context, String title, String stats) {
    return Container(
      width: Get.width / 6,
      height: Get.height / 5,
      decoration:const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style:const  TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              stats,
              style:const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
