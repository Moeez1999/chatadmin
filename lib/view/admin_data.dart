// ignore_for_file: prefer_is_empty

import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:web_admin_chat_app/controllers/admin_data_controller.dart';

import 'package:web_admin_chat_app/utils/app_colors.dart';
import 'package:web_admin_chat_app/view/app_header.dart';

import 'package:web_admin_chat_app/widgets/app_textfield.dart';

class AdminData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminDataController>(
      init: AdminDataController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.backgroundcolor,
          body: ListView(
            children: [
              Header(),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'Admin List',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w700),
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
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: CommonTextFormField(_.search, 'Search by Email',
                          'Search', false, TextInputType.name, 1, (e) {
                        _.searchFunction(e);
                      }, () {}),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ),
              _.isLoading
                  ? Center(
                      child: SizedBox(
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
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: DataTable2(
                            dataTextStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            sortAscending: true,
                            dividerThickness: 2,
                            dataRowHeight: 60,
                            // dataRowColor: MaterialStateColor.resolveWith(
                            //     (states) => Colors.white),
                            columns: const <DataColumn>[
                              DataColumn2(
                                label: Text('Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primarycolor)),
                              ),
                              DataColumn2(
                                label: Center(
                                    child: Text(
                                  'Email',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primarycolor),
                                )),
                              ),
                              DataColumn2(
                                label: Center(
                                    child: Text(
                                  'Actions',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primarycolor),
                                )),
                              ),
                            ],
                            rows: List.generate(
                                _.searchlist.length == 0
                                    ? _.adminlist.length
                                    : _.searchlist.length, (index) {
                              return DataRow(cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      _.searchlist.length == 0
                                          ? Text(
                                              '${_.adminlist[index]['firstName']}',
                                              //style: titleStyle,
                                            )
                                          : Text(
                                              '${_.searchlist[index]['firstName']} ',
                                              //style: titleStyle,
                                            )
                                    ],
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: _.searchlist.length == 0
                                        ? Text(
                                            '${_.adminlist[index]['email']}',
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
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffE3EFFF),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: IconButton(
                                          icon: const Icon(
                                            FontAwesomeIcons.trashAlt,
                                            color: AppColors.redcolor,
                                          ),
                                          onPressed: () {
                                            _.searchlist.length == 0
                                                ? _.deleteuser(
                                                    _.adminlist[index]['uid'])
                                                : _.deleteuser(
                                                    _.searchlist[index]['uid']);
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
}
