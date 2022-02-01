import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:web_admin_chat_app/controllers/users_data_controller.dart';
import 'package:web_admin_chat_app/utils/app_colors.dart';
import 'package:web_admin_chat_app/view/app_header.dart';
import 'package:web_admin_chat_app/widgets/app_buttons.dart';
import 'package:web_admin_chat_app/widgets/app_textfield.dart';

class NonCorporateAccount extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<NonCorporateAccountController>(
      init: NonCorporateAccountController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.backgroundcolor,
          body: ListView(
            children: [
              Header(),
               Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Users List',
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
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // AutoSizeText("All Non Corporate Users",
                    //     style: pageTitleStyle),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: CommonTextFormField(_.search, 'Search by Email',
                          'Search', false, TextInputType.name, 1, (e) {
                        _.searchFunction(e);
                      }, (){}),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    // CircularButtons(
                    //     text: "Add Non Corporate Users ",
                    //     width: width * 0.15,
                    //     height: 40,
                    //     textStyle: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 13,
                    //         fontWeight: FontWeight.w500),
                    //     onPressed: () {
                    //       // page.jumpToPage(9);
                    //     },
                    //     backgroundColor: AppColors.redcolor,
                    //     textColor: Colors.white,
                    //     borderColor: AppColors.redcolor)
                  ],
                ),
              ),
              _.isLoading
                  ? Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: LoadingAnimationWidget.inkDrop(
                          color: AppColors.bluecolor,
                          size: 50,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: DataTable2(
                            dataTextStyle:  TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                            sortAscending: true,
                            dividerThickness: 4,
                            dataRowHeight: 60,
                            dataRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white),
                            columns: const <DataColumn>[
                              DataColumn2(
                                label: Text('Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primarycolor)
                                    ),
                              ),
                              DataColumn2(
                                label: Center(
                                    child: Text('Email',style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primarycolor), )),
                              ),
                              DataColumn2(
                                label: Center(
                                    child:
                                        Text('Actions',style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primarycolor), )),
                              ),
                            ],
                            rows: List.generate(
                                _.searchlist.length == 0
                                    ? _.userlist.length
                                    : _.searchlist.length, (index) {
                              return DataRow(cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      // Container(
                                      //   width: 35,
                                      //   height: 35.0,
                                      //   decoration: new BoxDecoration(
                                      //     shape: BoxShape.circle,
                                      //     image: DecorationImage(
                                      //       fit: BoxFit.fill,
                                      //       image: _.nonCorporatelist[index]['imageUrl']
                                      //                   .toString() ==
                                      //               ''
                                      //           ? MemoryImage(
                                      //               base64Decode(
                                      //                 _.nonCorporatelist[index]
                                      //                     ['imageUrl'],
                                      //               ),
                                      //             )
                                      //           : NetworkImage(
                                      //                   'https://images.unsplash.com/photo-1542744094-3a31f272c490?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2ViJTIwZGVzaWdufGVufDB8fDB8fA%3D%3D&w=1000&q=80')
                                      //               as ImageProvider,
                                      //     ),
                                      //   ),
                                      // ),
                                      // CircleAvatar(
                                      //   maxRadius: 20,
                                      //   backgroundColor: Colors.grey,
                                      //    backgroundImage: _.nurseslist[index]['imageUrl'].toString().isEmpty
                                      //     ? MemoryImage(
                                      //     base64Decode(
                                      //       _.nurseslist[index]['imageUrl'],
                                      //     ),
                                      //   ) : null,
                                      // ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      _.searchlist.length == 0
                                          ? Text(
                                              '${_.userlist[index]['username']}',
                                              //style: titleStyle,
                                            )
                                          : Text(
                                              '${_.searchlist[index]['username']} ',
                                              //style: titleStyle,
                                            )
                                    ],
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: _.searchlist.length == 0
                                        ? Text(
                                            '${_.userlist[index]['email']}',
                                            //style: titleStyle,
                                          )
                                        : Text(
                                            '${_.searchlist[index]['email']}',
                                            //style: titleStyle,
                                          ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Container(
                                      //   height: 40,
                                      //   width: 50,
                                      //   decoration: BoxDecoration(
                                      //       color: Color(0xffE3EFFF),
                                      //       borderRadius: BorderRadius.all(
                                      //           Radius.circular(5))),
                                      //   child: IconButton(
                                      //     icon: Icon(
                                      //       FontAwesomeIcons.edit,
                                      //       color: AppColors.bluecolor,
                                      //     ),
                                      //     onPressed: () {
                                      //       _.searchlist.length == 0?
                                      //       showAlertBox(_, context , _.userlist[index]['username'] ,_.userlist[index]['email'] , _.userlist[index]['id'] )
                                      //           :
                                      //       showAlertBox(_, context , _.searchlist[index]['username'] ,_.searchlist[index]['email'] , _.searchlist[index]['id'] );

                                      //     },
                                      //   ),
                                      // ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xffE3EFFF),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.trashAlt,
                                            color: AppColors.redcolor,
                                          ),
                                          onPressed: () {
                                            _.searchlist.length == 0
                                                ? _.deletenonCorporate(
                                                    _.userlist[index]
                                                        ['id'])
                                                : _.deletenonCorporate(
                                                    _.searchlist[index]['id']);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]);
                            }),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  showAlertBox(NonCorporateAccountController _, context , firstname , email , docid) {
    _.firstname.text = firstname;
    _.email.text = email;
    _.update();
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Update Data",
          style: TextStyle(),
        ),
        content: Container(
          height: 250,
          width: Get.width / 2.5,
          child: Column(
            children: [
              Container(
                width: Get.width / 2.6,
                child: CommonTextFormField(
                  _.firstname,
                  'First Name',
                  'First Name',
                  false,
                  TextInputType.name,
                  1,
                      (e) {}, (){}
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: Get.width / 2.6,
                child: CommonTextFormField(
                  _.email,
                  'Last Name',
                  'Last Name',
                  false,
                  TextInputType.name,
                  1,
                      (e) {}, (){}
                ),
              ),
              Spacer(),
              CircularButtons(
                text: "Update Data",
                width: 150,
                height: 40,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () {
                  Get.back();
                  _.updateuser(docid);
                },
                backgroundColor: AppColors.bluecolor,
                textColor: Colors.white,
                borderColor: AppColors.bluecolor,
              ),
            ],
          ),
          // child: ,
        ),
      ),
    );
  }
}
