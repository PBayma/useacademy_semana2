import 'package:flutter/material.dart';

import '../../../domain/entities/category_arguments.dart';
import 'widgets/category_movie_container.dart';

class CategoryPage extends StatelessWidget {
  final CategoryArguments categoryArguments;
  const CategoryPage({
    Key? key,
    required this.categoryArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3A3A3A),
        title: const Text('Ver mais'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  categoryArguments.category,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily:
                        Theme.of(context).textTheme.headline2!.fontFamily,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(8),
                  childAspectRatio: 1.5 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: categoryArguments.moviesList
                      .map(
                        (movie) => CategoryMovieContainer(
                          imageUrl: movie.image,
                          movieTitle: movie.title,
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/movie',
                              arguments: movie.id,
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
