
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:web_admin_chat_app/controllers/sidemenu_controller.dart';
import 'package:web_admin_chat_app/view/add_signals.dart';
import 'package:web_admin_chat_app/view/dashboard.dart';
import 'package:web_admin_chat_app/view/login.dart';



class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<SidebarController>(
      init: SidebarController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _.isLoading
              ? Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(24.0),
                            bottomRight: Radius.circular(24.0),
                            bottomLeft: Radius.circular(24.0),
                            topLeft: Radius.circular(24.0)),
                      ),
                      child: SideMenu(
                        controller: _.page,
                        style: SideMenuStyle(
                            openSideMenuWidth:
                                MediaQuery.of(context).size.width * 0.17,
                            unselectedIconColor: Color(0XFF4F8484),
                            compactSideMenuWidth: width,
                            displayMode: SideMenuDisplayMode.open,
                            hoverColor: Colors.grey,
                            selectedColor: Color(0xffEDF1F4),
                            selectedTitleTextStyle:
                                TextStyle(color: Colors.black, fontSize: 15),
                            unselectedTitleTextStyle: TextStyle(
                                fontSize: 15, color: Color(0XFF4F8484)),
                            selectedIconColor: Colors.black,
                            backgroundColor: Colors.white,
                            iconSize: 15),
                            
                        title: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Image.asset(
                                'assets/images/app_logo.png',
                                height: 100,
                                width: 250,
                              ),
                            ),
                          ],
                        ),
                        items:  [
                                SideMenuItem(
                                  priority: 0,
                                  title: 'Dashboard',
                                  onTap: () {
                                    _.page.jumpToPage(0);
                                  },
                                  icon: FontAwesomeIcons.columns,
                                ),
                                SideMenuItem(
                                  priority: 1,
                                  title: 'Add Signals',
                                  onTap: () {
                                    _.page.jumpToPage(1);
                                  },
                                  icon: FontAwesomeIcons.user,
                                ),
                               
                              ]
                           
                              
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        pageSnapping: false,
                        reverse: false,
                        physics: const NeverScrollableScrollPhysics(),
                        allowImplicitScrolling: false,
                        controller: _.page,
                        children:const [
                           DashBoard(),
                          AddSignals()
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
