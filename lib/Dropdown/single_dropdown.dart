// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertemplate/DB_Services/database_read.dart';
import 'package:fluttertemplate/DataModels/dm_category.dart';

class SingleDropdown extends StatefulWidget {
  const SingleDropdown({Key? key}) : super(key: key);

  @override
  State<SingleDropdown> createState() => _SingleDropdownState();
}

class _SingleDropdownState extends State<SingleDropdown> {
  String? selectedCat;
  List<Dm_Category>? catlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Dropdowns',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            multiDropdown(true),
            multiDropdown(false),
          ],
        ),
      ),
    );
  }

  TextStyle textStyleForthis() {
    return const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w500);
  }

  Container multiDropdown(bool isempty) {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(20, 4, 20, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(
            color: const Color.fromARGB(255, 59, 11, 11), width: 0.6),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: FutureBuilder<List<Dm_Category>?>(
            // future: DatabaseReadService().getDropdown_CatList(),
            future: isempty
                ? DatabaseReadService().getEmptyList()
                : DatabaseReadService().getDropdown_CatList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Text(
                    "No categories Found",
                    style: textStyleForthis(),
                  );
                } else {
                  catlist = snapshot.data!;
                  return DropdownButtonHideUnderline(
                      child: DropdownButton(
                    // isExpanded: true,
                    // icon: const Icon(Icons.arrow_downward),
                    items: snapshot.data!.map((Dm_Category category) {
                      return DropdownMenuItem(
                          value: category.maincat,
                          child: Text(
                            category.maincat.toString(),
                          ));
                    }).toList(),
                    onChanged: (String? value) {
                      selectedCat = value;
                      print("selected category is ${selectedCat.toString()}");

                      setState(() {});
                    },
                    value: selectedCat,
                    hint: Text('Select Category', style: textStyleForthis()),
                  ));
                }
              } else {
                return const LinearProgressIndicator();
              }
            }),
      ),
    );
  }
}
