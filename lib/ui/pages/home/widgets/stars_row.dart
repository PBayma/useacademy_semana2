import 'package:flutter/material.dart';

class StarsRow extends StatelessWidget {
  final String firstStarActor;
  final String secondStarActor;
  const StarsRow(
      {Key? key, required this.firstStarActor, required this.secondStarActor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            firstStarActor,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.headline5?.fontFamily,
              fontSize: Theme.of(context).textTheme.headline5?.fontSize,
              color: Theme.of(context).textTheme.headline5?.color,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '-',
            style:
                TextStyle(color: Theme.of(context).textTheme.headline5?.color),
          ),
          Text(
            secondStarActor,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.headline5?.fontFamily,
              fontSize: Theme.of(context).textTheme.headline5?.fontSize,
              color: Theme.of(context).textTheme.headline5?.color,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
    ;
  }
}
