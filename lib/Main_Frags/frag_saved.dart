import 'package:fluttertemplate/Components/list_view_slidable.dart';
import 'package:fluttertemplate/PushNotification/notifcation_service.dart';
import 'package:fluttertemplate/RecyclerControllers/users_controller.dart';
import 'package:fluttertemplate/Dialogs/no_resulfound.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:get/get.dart';

class FragSaved extends StatefulWidget {
  const FragSaved({Key? key}) : super(key: key);

  @override
  State<FragSaved> createState() => _FragSavedState();
}

class _FragSavedState extends State<FragSaved> {
  UsersController usersController = Get.put(UsersController());
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // String uid = FirebaseAuth.instance.currentUser!.uid.toString();
    // String uid = "";

    usersController.fetch_allusers();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        // brightness: Brightness.light,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: Constants.recyclerpadding,
              child: const Text(
                "Saved users",
                style: Constants.headingTextStyle,
              ),
            ),
            savedList(),
            // NoSavedColleges()
          ],
        ),
      ),
    );
  }

  Expanded savedList() {
    return Expanded(
      child: Obx(() {
        if (usersController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (usersController.userList.isEmpty) {
            return noResultFound(context, "No Users Found");
          }
          return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: usersController.userList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _selectedIndex = index;
                    print("Selected index is $_selectedIndex");
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ActHome(
                    //           referalsController.referalList[index]),
                    //     ));
                    NotificationService().showNotificationBasic(
                        title: 'Hello', body: 'It works!');
                  },
                  child: Cust_ListView_Slidable(
                    mainheading:
                        usersController.userList[index].name.toString(),
                    subheading:
                        usersController.userList[index].imgurl.toString(),
                    onTap: () => {},
                  ),
                );
              });
        }
      }),
    );
  }
}
