import 'package:core/core.dart';
import 'package:tv/tv.dart';
import 'package:flutter/foundation.dart';

class PopularTVNotifier extends ChangeNotifier {
  final GetPopularTVShows getPopularTVShows;

  PopularTVNotifier(this.getPopularTVShows);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TV> _tv = [];
  List<TV> get tvShows => _tv;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularTVShows() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTVShows.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvShowsData) {
        _tv = tvShowsData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
