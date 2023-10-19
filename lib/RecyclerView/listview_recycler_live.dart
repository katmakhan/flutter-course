import 'package:flutter/material.dart';
import 'package:fluttertemplate/Components/list_view_slidable.dart';
import 'package:fluttertemplate/DB_Services/database_read.dart';
import 'package:fluttertemplate/DataModels/dm_user.dart';

StreamBuilder<List<Dm_User>> subscribeToRealtimeData() {
  return StreamBuilder<List<Dm_User>>(
    stream: DatabaseReadService().getUsers(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return const Center(child: CircularProgressIndicator());
        default:
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Something Went Wrong Try later'));
          } else {
            var userslist = snapshot.data;

            if (userslist!.isEmpty) {
              return const Center(child: Text('No Users Found'));
            } else {
              print("Length is ${userslist.length}");
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: userslist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        //Call the dialog
                      },
                      child: Cust_ListView_Slidable(
                          mainheading: userslist[index].name.toString(),
                          subheading: "something else",
                          onTap: tapFunction),
                    );
                  });
            }
          }
      }
    },
  );
}

void tapFunction() {}
