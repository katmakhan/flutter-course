import 'package:flutter/material.dart';
import 'package:fluttertemplate/Components/list_view_slidable_stock.dart';
import 'package:fluttertemplate/DB_Services/database_read.dart';
import 'package:fluttertemplate/DataModels/dm_stock.dart';

StreamBuilder<List<dm_stock>> subscribeToRealtimeData(scrollController, limit) {
  List<dm_stock> oldstocklist = [];
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
            var stocklist = snapshot.data;

            if (stocklist!.isEmpty) {
              return const Center(child: Text('No Users Found'));
            } else {
              print("Length fetched ${stocklist.length}");
              createprevdataset(stocklist, oldstocklist);

              return ListView.builder(
                  padding: EdgeInsets.zero,
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: stocklist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        //Call the dialog
                      },
                      child: Cust_ListView_Slidable_Stock(
                          stocknameval: stocklist[index].stckname.toString(),
                          ltpval: stocklist[index].ltp,
                          prevval: stocklist[index].pltp,
                          onTap: tapFunction),
                    );
                  });
            }
          }
      }
    },
  );
}

void createprevdataset(
    List<dm_stock> currentstocklist, List<dm_stock> oldstocklist) {
  print("Checking the length of both list, when loading more, it will crash");
  if (currentstocklist.length == oldstocklist.length) {
    print("both list are there, combine old and new ltp");
    // copy the oldstocklist ltp to currenstocklist prevval
    for (dm_stock stock in currentstocklist) {
      //Find the index
      int index = oldstocklist
          .indexWhere((oldstock) => oldstock.stckname == stock.stckname);

      //Update the prev ltp
      stock.pltp = oldstocklist[index].ltp;

      //Update the current ltp to oldstocklist
      oldstocklist[index].ltp = stock.ltp;
    }
  }
  //Else update the currentstocklist with oldstocklist
  else {
    oldstocklist.clear();
    for (dm_stock stock in currentstocklist) {
      stock.pltp = stock.ltp;
    }
    oldstocklist.addAll(currentstocklist);
  }
}

void tapFunction() {}
