import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../widgets/actors_row.dart';
import 'movie_presenter.dart';
import 'widgets/actors_container.dart';
import 'widgets/line_container.dart';
import 'widgets/plot_container.dart';

class MoviePage extends StatefulWidget {
  final MoviePresenter presenter;
  final String movieId;
  const MoviePage({Key? key, required this.presenter, required this.movieId})
      : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    debugPrint(widget.movieId);
    widget.presenter.loadMovie(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3A3A3A),
        title: const Text('Detalhes do filme'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: StreamBuilder<Movie>(
              stream: widget.presenter.movieStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(height: 5),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data!.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  snapshot.data!.title,
                                  style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        ?.fontFamily,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        ?.fontSize,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        ?.color,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ActorsRow(
                                  firstActor: snapshot.data!.actorList[0].name,
                                  secondActor: snapshot.data!.actorList[1].name,
                                  thirdActor: snapshot.data!.actorList[2].name,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const LineContainer(),
                      PlotContainer(
                        plot: snapshot.data!.plot,
                      ),
                      const LineContainer(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Elenco',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .fontFamily,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .color,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return ActorsContainer(
                                    urlImage:
                                        snapshot.data!.actorList[index].image,
                                    actorName:
                                        snapshot.data!.actorList[index].name,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
