import 'package:flutter/material.dart';
import 'package:fluttertemplate/Dialogs/no_resulfound.dart';
import 'package:fluttertemplate/Single_Items/si_users.dart';
import 'package:get/get.dart';

Flexible gridview_RecyclerView_dynamic(userscontroller, context) {
  return Flexible(
    child: Obx(() {
      if (userscontroller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        if (userscontroller.userList.isEmpty) {
          return Center(child: noResultFound(context, "No Users Found"));
        } else {
          return GridView.builder(
              // scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              shrinkWrap: true, // For wrapping inside the Column
              primary: false,
              physics:
                  const NeverScrollableScrollPhysics(), // For wrapping the column
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: userscontroller.userList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: si_ProfileImage(
                      userscontroller.userList[index].imgurl.toString()),
                );
              });
        }
      }
    }),
  );
}
