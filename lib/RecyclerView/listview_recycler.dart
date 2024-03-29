import 'package:flutter/material.dart';
import 'package:fluttertemplate/Components/SingleItems/list_view_slidable.dart';
import 'package:fluttertemplate/Dialogs/no_resulfound.dart';
import 'package:get/get.dart';

Flexible listview_Recylcerview_dynamic(usercontroller, context) {
  return Flexible(
    fit: FlexFit.tight,
    child: Obx(() {
      if (usercontroller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        if (usercontroller.userList.isEmpty) {
          return Center(child: noResultFound(context, "No Users found"));
        } else {
          return ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: usercontroller.userList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //Call the dialog
                  },
                  child: const Cust_ListView_Slidable(
                      mainheading: "something",
                      subheading: "something else",
                      onTap: tapFunction),
                );
              });
        }
      }
    }),
  );
}

void tapFunction() {}
