import 'package:flutter/material.dart';
import 'package:fluttertemplate/DataModels/dm_gallery.dart';

class GalleryCat extends StatelessWidget {
  final Dm_Gallery gallery;
  const GalleryCat(this.gallery, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffffe3e3), width: 1),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(4),
              height: 85,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(gallery.imgurl.toString()),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Text(
              gallery.title.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
