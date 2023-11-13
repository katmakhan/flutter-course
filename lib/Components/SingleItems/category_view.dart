import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowCategory extends StatelessWidget {
  final String Image, desc, title, url;
  const ShowCategory(
      {super.key,
      required this.Image,
      required this.desc,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl: url)));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: Image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            title,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            desc,
            maxLines: 3,
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
