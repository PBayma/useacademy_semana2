import 'package:flutter/material.dart';

import '../../../domain/entities/category_arguments.dart';
import '../../../domain/entities/entities.dart';
import '../widgets/actors_row.dart';
import 'home_presenter.dart';
import 'widgets/header_movie_container.dart';
import 'widgets/movie_container.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.presenter.loadToYouMovies();
    widget.presenter.loadArsenalMovies();
    widget.presenter.loadAmericaMovies();

    super.initState();
  }

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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 0.75,
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
                const SizedBox(height: 20),
                StreamBuilder<List<Movie>>(
                  stream: widget.presenter.toYouMoviesStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Column(
                        children: [
                          HeaderMovieContainer(
                            title: 'Para Você',
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/category',
                                arguments: CategoryArguments(
                                  category: 'Para Você',
                                  moviesList: snapshot.data!,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return MovieContainer(
                                    imageUrl: snapshot.data![index].image,
                                    movieTitle: snapshot.data![index].title,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        '/movie',
                                        arguments: snapshot.data![index].id,
                                      );
                                    },
                                  );
                                }),
                          ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                const SizedBox(height: 20),
                StreamBuilder<List<Movie>>(
                  stream: widget.presenter.arsenalMoviesStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Column(
                        children: [
                          HeaderMovieContainer(
                            title: 'Ação',
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/category',
                                arguments: CategoryArguments(
                                  category: 'Ação',
                                  moviesList: snapshot.data!,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return MovieContainer(
                                    imageUrl: snapshot.data![index].image,
                                    movieTitle: snapshot.data![index].title,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        '/movie',
                                        arguments: snapshot.data![index].id,
                                      );
                                    },
                                  );
                                }),
                          ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                const SizedBox(height: 20),
                StreamBuilder<List<Movie>>(
                  stream: widget.presenter.americaMovieStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Column(
                        children: [
                          HeaderMovieContainer(
                            title: 'Americanos',
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/category',
                                arguments: CategoryArguments(
                                  category: 'Americanos',
                                  moviesList: snapshot.data!,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return MovieContainer(
                                    imageUrl: snapshot.data![index].image,
                                    movieTitle: snapshot.data![index].title,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        '/movie',
                                        arguments: snapshot.data![index].id,
                                      );
                                    },
                                  );
                                }),
                          ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
