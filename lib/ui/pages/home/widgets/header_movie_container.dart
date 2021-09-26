import 'package:flutter/material.dart';

class HeaderMovieContainer extends StatelessWidget {
  final String title;
  const HeaderMovieContainer({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.headline4?.fontFamily,
              fontSize: Theme.of(context).textTheme.headline4?.fontSize,
              color: Theme.of(context).textTheme.headline4?.color,
            ),
          ),
          InkWell(
            child: Text(
              'Ver mais',
              style: TextStyle(
                color: Theme.of(context).textTheme.button?.color,
                fontFamily: Theme.of(context).textTheme.button?.fontFamily,
                fontSize: Theme.of(context).textTheme.button?.fontSize,
              ),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
