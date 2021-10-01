import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryMovieContainer extends StatelessWidget {
  final String imageUrl;
  final String movieTitle;
  final Function() onTap;

  const CategoryMovieContainer({
    Key? key,
    required this.imageUrl,
    required this.movieTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              alignment: Alignment.bottomLeft,
              child: Text(
                movieTitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
