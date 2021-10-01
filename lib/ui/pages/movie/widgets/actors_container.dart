import 'package:flutter/material.dart';

class ActorsContainer extends StatelessWidget {
  final String urlImage;

  const ActorsContainer({Key? key, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(urlImage),
        ),
      ),
    );
  }
}
