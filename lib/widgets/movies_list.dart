import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:roovies/models/movie.dart';
import 'package:roovies/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:roovies/screens/movie_details_screen.dart';

class MoviesList extends StatefulWidget {
  final int genreId;
  MoviesList.byGenreId(this.genreId);
  MoviesList.trending() : this.genreId = null;
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  bool firstRun, successful;
  @override
  void initState() {
    super.initState();
    firstRun = true;
    successful = false;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (firstRun) {
      bool done = true;
      if (widget.genreId != null) {
        done = await context
            .read<MoviesProvider>()
            .fetchMoviesByGenreId(widget.genreId);
      }
      if (mounted) {
        setState(() {
          successful = done;
          firstRun = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4 - 48,
      width: MediaQuery.of(context).size.width,
      child: (firstRun)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (successful)
              ? ListView.builder(
                  itemExtent: 140,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    Movie movie = (widget.genreId != null)
                        ? context.watch<MoviesProvider>().moviesByGenre[index]
                        : context.watch<MoviesProvider>().trendingMovies[index];
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return MovieDetailsScreen();
                          //     },
                          //   ),
                          // );
                          Navigator.of(context).pushNamed(
                              MovieDetailsScreen.routeName,
                              arguments: movie);
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      movie.posterPath,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              flex: 7,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  movie.title,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        '${movie.rating}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    FittedBox(
                                      child: RatingBar(
                                        initialRating: movie.rating / 2,
                                        allowHalfRating: true,
                                        ignoreGestures: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: null,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    'Error has occurred',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
    );
  }
}