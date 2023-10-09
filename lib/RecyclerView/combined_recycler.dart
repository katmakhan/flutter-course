// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertemplate/RecyclerControllers/gallery_controller.dart';
import 'package:fluttertemplate/RecyclerControllers/users_controller.dart';
import 'package:fluttertemplate/RecyclerView/listview_recycler.dart';
import 'package:fluttertemplate/RecyclerView/gridview_recycler.dart';
import 'package:get/get.dart';

class CombinedRecycler extends StatefulWidget {
  const CombinedRecycler({Key? key}) : super(key: key);

  @override
  State<CombinedRecycler> createState() => _CombinedRecyclerState();
}

class _CombinedRecyclerState extends State<CombinedRecycler> {
  UsersController userscontroller = Get.put(UsersController());
  gallery_Controller gallerycatcontroller = Get.put(gallery_Controller());
  UsersController usercontroller = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    gallerycatcontroller.fetch_gallerycat("newcat");

    userscontroller.fetch_allusers();
    return Scaffold(
      // appBar: ,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // ----------Whenever using Column inside SingleChildScrollview
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textHeading("List View Users"),
              gridview_RecyclerView_dynamic(usercontroller, context),
              // textHeading("Grid View Gallery"),
              // gridview_RecyclerView_dynamic(gallerycatcontroller, context),
              textHeading("List view Users 2"),
              listview_Recylcerview_dynamic(usercontroller, context),
            ],
          ),
        ),
      ),
    );
  }

  Container textHeading(textdata) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff3831AD),
            Color(0xff350055),
          ],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      padding: const EdgeInsets.all(8),
      child: Text(
        textdata,
        style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Color(0xFFffffff),
            fontWeight: FontWeight.w600),
      ),
    );
  }

  // Expanded selectParish(BuildContext context) {
  //   return Expanded(
  //     child: Container(
  //       height: 50,
  //       margin: EdgeInsets.fromLTRB(20, 4, 20, 8),
  //       // width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(5),
  //         color: Colors.white,
  //         border: Border.all(color: Color(0xffe0e0e0), width: 0.6),
  //       ),
  //       child: Padding(
  //         padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
  //         child: FutureBuilder<List<dm_parish>?>(
  //             future: DatabaseReadService()
  //                 .getParishFullDetails(widget.foraneObjc.name.toString()),
  //             builder: (context, snapshot) {
  //               print(
  //                   "Checked parish is.." + widget.foraneObjc.name.toString());
  //               if (snapshot.hasData) {
  //                 if (snapshot.data!.isEmpty) {
  //                   return Text(
  //                     "No parish Found",
  //                     style: TextStyle(
  //                         fontFamily: 'Poppins',
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w600,
  //                         color: Color(0xFFed1c24)),
  //                   );
  //                   // return Container(
  //                   //   height: 50,
  //                   // );
  //                 } else {
  //                   parishlist = snapshot.data!;
  //                   return DropdownButtonHideUnderline(
  //                       child: DropdownButton(
  //                     // icon: Icon(Icons.arrow_downward),
  //                     items: snapshot.data!.map((dm_parish parish) {
  //                       // print("Heree the values are " + value.toString());
  //                       return DropdownMenuItem(
  //                         value: parish.name,
  //                         child: Text(parish.name.toString()),
  //                       );
  //                     }).toList(),
  //                     onChanged: (String? value) {
  //                       _selectedParish = value;
  //                       print(
  //                           "selected parish is " + _selectedParish.toString());
  //                       usercontroller
  //                           .fetcheventsParish(_selectedParish.toString());
  //                       setState(() {});
  //                     },
  //                     value: _selectedParish,
  //                     hint: const Text('Select Parish',
  //                         style: TextStyle(
  //                             fontFamily: 'Poppins',
  //                             fontSize: 12,
  //                             color: Color(0xFF000000),
  //                             fontWeight: FontWeight.w500)),
  //                   ));
  //                 }
  //               } else {
  //                 return const LinearProgressIndicator();
  //               }
  //             }),
  //       ),
  //     ),
  //   );
  // }
}
