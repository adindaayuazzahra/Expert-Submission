import 'package:ditonton/common/state_enum.dart';

import 'package:ditonton/domain/entities/tv_entities/tv.dart';

import 'package:ditonton/domain/usecases/tv_usecase/get_top_rated_tv_show.dart';
import 'package:flutter/foundation.dart';

class TopRatedTVNotifier extends ChangeNotifier {
  final GetTopRatedTVShows getTopRatedTVShows;

  TopRatedTVNotifier({required this.getTopRatedTVShows});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TV> _tv = [];
  List<TV> get tvshows => _tv;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedTVShows() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTVShows.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvshowsData) {
        _tv = tvshowsData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
