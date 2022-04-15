import 'package:ditonton/domain/entities/tv_entities/tv.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_detail.dart';
import 'package:ditonton/domain/usecases/tv_usecase/get_tv_recommendations.dart';
import 'package:ditonton/domain/usecases/tv_usecase/get_tv_show_detail.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tv_usecase/get_watchlist_tv_status.dart';
import 'package:ditonton/domain/usecases/tv_usecase/remove_tv_watchlist.dart';
import 'package:ditonton/domain/usecases/tv_usecase/save_tv_watchlist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TVDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTVShowDetail getTVDetail;
  final GetTVRecommendations getTVRecommendations;
  final GetWatchlistTVStatus getWatchListTVStatus;
  final SaveTVWatchList saveTVWatchlist;
  final RemoveTVWatchlist removeTVWatchlist;

  TVDetailNotifier({
    required this.getTVDetail,
    required this.getTVRecommendations,
    required this.getWatchListTVStatus,
    required this.saveTVWatchlist,
    required this.removeTVWatchlist,
  });

  late TVDetail _tv;
  TVDetail get tvShow => _tv;

  RequestState _tvState = RequestState.Empty;
  RequestState get tvState => _tvState;

  List<TV> _tvRecommendations = [];
  List<TV> get tvRecommendations => _tvRecommendations;

  RequestState _recommendationState = RequestState.Empty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> fetchTVDetail(int id) async {
    _tvState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getTVDetail.execute(id);
    final recommendationResult = await getTVRecommendations.execute(id);
    detailResult.fold(
      (failure) {
        _tvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvShow) {
        _recommendationState = RequestState.Loading;
        _tv = tvShow;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
          (tvShows) {
            _recommendationState = RequestState.Loaded;
            _tvRecommendations = tvShows;
          },
        );
        _tvState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> addWatchlist(TVDetail tvShow) async {
    final result = await saveTVWatchlist.execute(tvShow);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tvShow.id);
  }

  Future<void> removeFromWatchlist(TVDetail tvShow) async {
    final result = await removeTVWatchlist.execute(tvShow);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tvShow.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListTVStatus.execute(id);
    _isAddedtoWatchlist = result;
    notifyListeners();
  }
}
