import 'package:core/core.dart';
import 'package:tv/tv.dart';
import 'package:flutter/material.dart';

class TVListNotifier extends ChangeNotifier {
  var _tvOnTheAir = <TV>[];
  List<TV> get tvOnTheAir => _tvOnTheAir;

  RequestState _onTheAirState = RequestState.Empty;
  RequestState get onTheAirState => _onTheAirState;

  var _popularTVShows = <TV>[];
  List<TV> get popularTVShows => _popularTVShows;

  RequestState _popularTVShowsState = RequestState.Empty;
  RequestState get popularTVShowsState => _popularTVShowsState;

  var _topRatedTVShows = <TV>[];
  List<TV> get topRatedTVShows => _topRatedTVShows;

  RequestState _topRatedTVShowsState = RequestState.Empty;
  RequestState get topRatedTVShowsState => _topRatedTVShowsState;

  String _message = '';
  String get message => _message;

  TVListNotifier({
    required this.getTVOnTheAir,
    required this.getPopularTVShows,
    required this.getTopRatedTVShows,
  });

  final GetTVOnTheAir getTVOnTheAir;
  final GetPopularTVShows getPopularTVShows;
  final GetTopRatedTVShows getTopRatedTVShows;

  Future<void> fetchtvOnTheAir() async {
    _onTheAirState = RequestState.Loading;
    notifyListeners();

    final result = await getTVOnTheAir.execute();
    result.fold(
      (failure) {
        _onTheAirState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvShowsData) {
        _onTheAirState = RequestState.Loaded;
        _tvOnTheAir = tvShowsData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTVShows() async {
    _popularTVShowsState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTVShows.execute();
    result.fold(
      (failure) {
        _popularTVShowsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvShowsData) {
        _popularTVShowsState = RequestState.Loaded;
        _popularTVShows = tvShowsData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTVShows() async {
    _topRatedTVShowsState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTVShows.execute();
    result.fold(
      (failure) {
        _topRatedTVShowsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvShowsData) {
        _topRatedTVShowsState = RequestState.Loaded;
        _topRatedTVShows = tvShowsData;
        notifyListeners();
      },
    );
  }
}
