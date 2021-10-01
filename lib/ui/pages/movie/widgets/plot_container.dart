import 'package:flutter/material.dart';

class PlotContainer extends StatelessWidget {
  final String plot;
  const PlotContainer({Key? key, required this.plot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Sinopse',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline2!.fontSize,
              fontFamily: Theme.of(context).textTheme.headline2!.fontFamily,
              color: Theme.of(context).textTheme.headline2!.color,
            ),
          ),
          Text(
            plot,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
              fontFamily: Theme.of(context).textTheme.subtitle1!.fontFamily,
              color: Theme.of(context).textTheme.subtitle1!.color,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 8,
          )
        ],
      ),
    );
  }
}
