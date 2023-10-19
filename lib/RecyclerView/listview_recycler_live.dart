import 'package:flutter/material.dart';
import 'package:fluttertemplate/Components/list_view_slidable_stock.dart';
import 'package:fluttertemplate/DB_Services/database_read.dart';
import 'package:fluttertemplate/DataModels/dm_stock.dart';

StreamBuilder<List<dm_stock>> subscribeToRealtimeData(scrollController, limit) {
  return StreamBuilder<List<dm_stock>>(
    stream: DatabaseReadService().getStockdata(limit),
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
              print("Length fetched ${userslist.length}");

              return ListView.builder(
                  padding: EdgeInsets.zero,
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: userslist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        //Call the dialog
                      },
                      child: Cust_ListView_Slidable_Stock(
                          mainheading: userslist[index].stckname.toString(),
                          subheading: userslist[index].ltp.toString(),
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
