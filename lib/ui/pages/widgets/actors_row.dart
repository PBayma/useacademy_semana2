import 'package:flutter/material.dart';

class ActorsRow extends StatelessWidget {
  final String firstActor;
  final String secondActor;
  final String thirdActor;
  const ActorsRow({
    Key? key,
    required this.firstActor,
    required this.secondActor,
    required this.thirdActor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          firstActor,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.headline5?.fontFamily,
            fontSize: Theme.of(context).textTheme.headline5?.fontSize,
            color: Theme.of(context).textTheme.headline5?.color,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '-',
          style: TextStyle(color: Theme.of(context).textTheme.headline5?.color),
        ),
        Text(
          secondActor,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.headline5?.fontFamily,
            fontSize: Theme.of(context).textTheme.headline5?.fontSize,
            color: Theme.of(context).textTheme.headline5?.color,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '-',
          style: TextStyle(color: Theme.of(context).textTheme.headline5?.color),
        ),
        Text(
          thirdActor,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.headline5?.fontFamily,
            fontSize: Theme.of(context).textTheme.headline5?.fontSize,
            color: Theme.of(context).textTheme.headline5?.color,
          ),
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
