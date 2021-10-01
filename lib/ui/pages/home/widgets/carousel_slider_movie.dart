import 'package:flutter/material.dart';

import '../../widgets/actors_row.dart';

class CarouselSliderMovie extends StatelessWidget {
  const CarouselSliderMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Lançamento',
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.headline1?.fontFamily,
              fontSize: Theme.of(context).textTheme.headline3?.fontSize,
              color: Theme.of(context).textTheme.headline1?.color,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.55,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://m.media-amazon.com/images/M/MV5BNzhlY2E5NDUtYjJjYy00ODg3LWFkZWQtYTVmMzU4ZWZmOWJkXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_Ratio0.6791_AL_.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'Lost',
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.headline3?.fontFamily,
                  fontSize: Theme.of(context).textTheme.headline3?.fontSize,
                  color: Theme.of(context).textTheme.headline3?.color,
                ),
              ),
              const SizedBox(height: 10),
              const ActorsRow(
                firstActor: 'Jorge Garcia',
                secondActor: 'Josh Holloway',
                thirdActor: 'Yunjin Kin',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
