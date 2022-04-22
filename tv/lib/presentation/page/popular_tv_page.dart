import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/tv.dart';
import 'package:flutter/material.dart';

class PopularTVPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tv';

  @override
  _PopularTVPageState createState() => _PopularTVPageState();
}

class _PopularTVPageState extends State<PopularTVPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<TvPopularBloc>().add(OnTvPopularCalled()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular TV Shows'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvPopularBloc, TvPopularState>(
          key: Key('this_is_popular_page'),
          builder: (context, state) {
            if (state is TvPopularLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvPopularHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.result[index];
                  return TVCard(
                    key: Key('card_$index'),
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
                itemCount: state.result.length,
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
                  'There are no one popular tv show',
                  key: Key('empty_data'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
