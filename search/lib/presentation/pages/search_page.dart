import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/search.dart';
import 'package:flutter/material.dart';
import 'package:movie/movie.dart';
import 'package:tv/tv.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(9),
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
                SizedBox(height: 15),
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: TabBarView(
                    children: <Widget>[
                      //movie
                      Column(
                        children: [
                          TextField(
                            key: Key('movie_text_field'),
                            onChanged: (query) {
                              context
                                  .read<SearchMoviesBloc>()
                                  .add(OnQueryMoviesChange(query));
                            },
                            decoration: InputDecoration(
                              hintText: 'Search movie',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.search,
                          ),
                          SizedBox(height: 15),
                          BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
                            builder: (context, state) {
                              if (state is SearchMoviesLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is SearchMoviesHasData) {
                                final result = state.result;
                                return Expanded(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(8.0),
                                    itemBuilder: (context, index) {
                                      final movie = result[index];
                                      return MovieCard(
                                        key: Key('movie_card_$index'),
                                        movie: movie,
                                        //isWatchlist: false,
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            MovieDetailPage.ROUTE_NAME,
                                            arguments: movie.id,
                                          );
                                        },
                                      );
                                    },
                                    itemCount: result.length,
                                  ),
                                );
                              } else if (state is SearchMoviesError) {
                                return Expanded(
                                  child: Center(
                                    child: Text(
                                      state.message,
                                      key: Key('error_message'),
                                    ),
                                  ),
                                );
                              } else {
                                return Expanded(
                                  child: Center(
                                    child: Text('No Film Has Found',
                                        style: kSubtitle,
                                        textAlign: TextAlign.center,
                                        key: Key('empty_message')),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),

                      //tv
                      Column(
                        children: [
                          TextField(
                            key: Key('tv_text_field'),
                            onChanged: (query) {
                              context
                                  .read<SearchTvBloc>()
                                  .add(OnQueryTvChange(query));
                            },
                            decoration: InputDecoration(
                              hintText: 'Search tv',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.search,
                          ),
                          SizedBox(height: 16),
                          BlocBuilder<SearchTvBloc, SearchTvState>(
                            builder: (context, state) {
                              if (state is SearchTvLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is SearchTvHasData) {
                                final result = state.result;
                                return Expanded(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(8.0),
                                    itemBuilder: (context, index) {
                                      final tv = result[index];
                                      return TVCard(
                                        key: Key('tv_card_$index'),
                                        tv: tv,
                                        //isWatchlist: false,
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            TVDetailPage.ROUTE_NAME,
                                            arguments: tv.id,
                                          );
                                        },
                                      );
                                    },
                                    itemCount: result.length,
                                  ),
                                );
                              } else if (state is SearchTvError) {
                                return Expanded(
                                  child: Center(
                                    child: Text(state.message,
                                        key: Key('error_message')),
                                  ),
                                );
                              } else {
                                return Expanded(
                                  child: Center(
                                    child: Text(
                                      'No TV Shows Has Found',
                                      style: kSubtitle,
                                      textAlign: TextAlign.center,
                                      key: Key('empty_message'),
                                    ),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
