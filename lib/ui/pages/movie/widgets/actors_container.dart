import 'package:flutter/material.dart';

class ActorsContainer extends StatelessWidget {
  final String urlImage;
  final String actorName;

  const ActorsContainer(
      {Key? key, required this.urlImage, required this.actorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.35,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(urlImage),
              ),
            ),
          ),
        ),
        Align(
            child: Text(
          actorName,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.subtitle1!.fontFamily,
            fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
            color: Theme.of(context).textTheme.subtitle1!.color,
          ),
        )),
      ],
    );
  }
}
