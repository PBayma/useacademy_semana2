import 'package:flutter/material.dart';

class MovieContainer extends StatelessWidget {
  final String imageUrl;
  final String movieTitle;
  final Function() onTap;

  const MovieContainer({
    Key? key,
    required this.imageUrl,
    required this.movieTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.35,
            child: ClipRRect(
              child: Image.network(imageUrl),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              movieTitle,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
