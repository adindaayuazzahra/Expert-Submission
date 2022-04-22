import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:movie/movie.dart';
import 'package:tv/tv.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieWatchlistBloc>().add(OnFetchMovieWatchlist());
      context.read<TvWatchlistBloc>().add(OnFetchTvWatchlist());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<MovieWatchlistBloc>().add(OnFetchMovieWatchlist());
    context.read<TvWatchlistBloc>().add(OnFetchTvWatchlist());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            key: Key('this_is_watchlist'),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(9),
                child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(30)),
                  tabs: [
                    Tab(
                      child: Text(
                        'Movies',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'TV Shows',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 530,
                child: TabBarView(
                  children: [
                    //movie
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          BlocBuilder<MovieWatchlistBloc, MovieWatchlistState>(
                            builder: (context, state) {
                              if (state is MovieWatchlistLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is MovieWatchlistHasData) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final movie = state.result[index];
                                    return MovieCard(
                                      key: Key('movie_card_$index'),
                                      movie: movie,
                                      //isWatchlist: true,
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          MovieDetailPage.ROUTE_NAME,
                                          arguments: movie.id,
                                        );
                                      },
                                    );
                                  },
                                  itemCount: state.result.length,
                                );
                              } else if (state is MovieWatchlistError) {
                                return Center(
                                  key: Key('error_message'),
                                  child: Text(state.message),
                                );
                              } else {
                                return SizedBox(
                                  key: Key('empty_data'),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    //tv
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          BlocBuilder<TvWatchlistBloc, TvWatchlistState>(
                            builder: (context, state) {
                              if (state is TvWatchlistLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is TvWatchlistHasData) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final tv = state.result[index];
                                    return TVCard(
                                      key: Key('tv_card_$index'),
                                      tv: tv,
                                      //isWatchlist: true,
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          TVDetailPage.ROUTE_NAME,
                                          arguments: tv.id,
                                        );
                                      },
                                    );
                                  },
                                  itemCount: state.result.length,
                                );
                              } else if (state is TvWatchlistError) {
                                return Center(
                                  key: Key('error_message'),
                                  child: Text(state.message),
                                );
                              } else {
                                return SizedBox(
                                  key: Key('empty_data'),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
