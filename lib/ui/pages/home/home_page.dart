import 'package:flutter/material.dart';
import 'package:useacademy_semana2/ui/pages/home/widgets/header_movie_container.dart';
import 'package:useacademy_semana2/ui/pages/widgets/actors_row.dart';

import 'widgets/movie_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3A3A3A),
        title: const Text('Nerdflix'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Lançamento',
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.headline1?.fontFamily,
                          fontSize:
                              Theme.of(context).textTheme.headline3?.fontSize,
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
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Lost',
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.fontFamily,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.fontSize,
                              color:
                                  Theme.of(context).textTheme.headline3?.color,
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
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    const HeaderMovieContainer(title: 'Para Você'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BYTM3ZTllNzItNTNmOS00NzJiLTg1MWMtMjMxNDc0NmJhODU5XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_Ratio0.6800_AL_.jpg',
                              movieTitle: 'Kingsman',
                              onTap: () {}),
                          MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BMDg2YzI0ODctYjliMy00NTU0LTkxODYtYTNkNjQwMzVmOTcxXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_Ratio0.6800_AL_.jpg',
                              movieTitle: 'John Wick 3',
                              onTap: () {}),
                          MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BMjM3MjQ1MzkxNl5BMl5BanBnXkFtZTgwODk1ODgyMjI@._V1_Ratio0.6800_AL_.jpg',
                              movieTitle: 'Baby Driver',
                              onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const HeaderMovieContainer(title: 'Ação'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BYTM3ZTllNzItNTNmOS00NzJiLTg1MWMtMjMxNDc0NmJhODU5XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_Ratio0.6800_AL_.jpg',
                              movieTitle: 'Kingsman',
                              onTap: () {}),
                          MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BMDg2YzI0ODctYjliMy00NTU0LTkxODYtYTNkNjQwMzVmOTcxXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_Ratio0.6800_AL_.jpg',
                              movieTitle: 'John Wick 3',
                              onTap: () {}),
                          MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BMjM3MjQ1MzkxNl5BMl5BanBnXkFtZTgwODk1ODgyMjI@._V1_Ratio0.6800_AL_.jpg',
                              movieTitle: 'Baby Driver',
                              onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
