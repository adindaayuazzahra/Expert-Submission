import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:about/about.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/tv.dart';
import 'package:search/search.dart';
import 'package:movie/movie.dart';
import 'package:watchlist/watchlist.dart';
import 'package:flutter/material.dart';

class HomeTvPage extends StatefulWidget {
  const HomeTvPage({Key? key}) : super(key: key);

  @override
  _HomeTvPageState createState() => _HomeTvPageState();
}

class _HomeTvPageState extends State<HomeTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvListBloc>().add(OnTvShowListCalled());
      context.read<TvPopularBloc>().add(OnTvPopularCalled());
      context.read<TvTopRatedBloc>().add(OnTvTopRatedCalled());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeMoviePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.tv_rounded),
              title: Text('TV Shows'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          key: Key('this_is_home_tv'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'On The Air',
                style: kHeading6,
              ),
              BlocBuilder<TvListBloc, TvListState>(
                builder: (context, state) {
                  if (state is TvListLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TvListHasData) {
                    final listTv = state.result;
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final tv = listTv[index];
                          return TVList(
                            key: Key('ota_$index'),
                            tv: tv,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                TVDetailPage.ROUTE_NAME,
                                arguments: tv.id,
                              );
                            },
                          );
                        },
                        itemCount: listTv.length,
                      ),
                    );
                  } else if (state is TvListError) {
                    return Center(
                      child: Text(
                        state.message,
                        key: Key('error_message'),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'There are no tv currently showing',
                        key: Key('empty_message'),
                      ),
                    );
                  }
                },
              ),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularTVPage.ROUTE_NAME),
                key: ('see_more_popular'),
              ),
              BlocBuilder<TvPopularBloc, TvPopularState>(
                builder: (context, state) {
                  if (state is TvPopularLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TvPopularHasData) {
                    final listTv = state.result;
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final tv = listTv[index];
                          return TVList(
                            key: Key('popular_$index'),
                            tv: tv,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                TVDetailPage.ROUTE_NAME,
                                arguments: tv.id,
                              );
                            },
                          );
                        },
                        itemCount: listTv.length,
                      ),
                    );
                  } else if (state is TvPopularError) {
                    return Center(
                      child: Text(
                        state.message,
                        key: Key('error_message'),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'There are no tv popular showing',
                        key: Key('empty_message'),
                      ),
                    );
                  }
                },
              ),
              _buildSubHeading(
                  title: 'Top Rated',
                  onTap: () {
                    Navigator.pushNamed(context, PopularTVPage.ROUTE_NAME);
                  },
                  key: 'see_more_top_rated'),
              BlocBuilder<TvTopRatedBloc, TvTopRatedState>(
                builder: (context, state) {
                  if (state is TvTopRatedLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TvTopRatedHasData) {
                    final listTv = state.result;
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final tv = listTv[index];
                          return TVList(
                            key: Key('top_rated_$index'),
                            tv: tv,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                TVDetailPage.ROUTE_NAME,
                                arguments: tv.id,
                              );
                            },
                          );
                        },
                        itemCount: listTv.length,
                      ),
                    );
                  } else if (state is TvTopRatedError) {
                    return Center(
                      child: Text(
                        state.message,
                        key: Key('error_message'),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'There are no tv top rated showing',
                        key: Key('empty_message'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({
    required String title,
    required Function() onTap,
    required String key,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              key: Key(key),
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TVList extends StatelessWidget {
  final TV tv;
  final Function() onTap;

  const TVList({
    Key? key,
    required this.tv,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: CachedNetworkImage(
            imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
