import 'package:fluttertemplate/Components/list_view_slidable.dart';
import 'package:fluttertemplate/RecyclerControllers/users_controller.dart';
import 'package:fluttertemplate/Dialogs/no_resulfound.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/RecyclerView/listview_recycler_live.dart';

class FragRealtime extends StatefulWidget {
  const FragRealtime({Key? key}) : super(key: key);

  @override
  State<FragRealtime> createState() => _FragRealtimeState();
}

class _FragRealtimeState extends State<FragRealtime> {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                "Realtime Data",
                style: Constants.headingTextStyle,
              ),
            ),
            // NoSavedColleges()
            Flexible(child: subscribeToRealtimeData())
          ],
        ),
      ),
    );
  }
}
