import 'package:flutter/material.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/RecyclerView/listview_recycler_live.dart';

class FragRealtime extends StatefulWidget {
  const FragRealtime({Key? key}) : super(key: key);

  @override
  State<FragRealtime> createState() => _FragRealtimeState();
}

class _FragRealtimeState extends State<FragRealtime> {
  int _limit = 10;
  final ScrollController _scrollController = ScrollController();

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
            Flexible(child: subscribeToRealtimeData(_scrollController, _limit))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // Add a listener to the scroll controller to detect scroll position
    _scrollController.addListener(() {
      // Check if the scroll position has reached the end of the list
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Call your loadMore function when the end of the list is reached
        loadMore();
      }
    });
    super.initState();
  }

  void loadMore() {
    // Check if its the max loadmore, then limit it, to not refresh when all is loaded
    if (_limit <= 46) {
      setState(() {
        _limit = _limit + 10;
      });
    }
  }
}
