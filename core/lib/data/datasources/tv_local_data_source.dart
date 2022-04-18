import 'package:core/core.dart';

abstract class TVLocalDataSource {
  Future<String> insertTVWatchlist(TVTable tv);
  Future<String> removeTVWatchlist(TVTable tv);
  Future<TVTable?> getTVShowById(int id);
  Future<List<TVTable>> getWatchlistTVShow();
}

class TVLocalDataSourceImpl implements TVLocalDataSource {
  final DatabaseHelperTv databaseHelperTV;

  TVLocalDataSourceImpl({
    required this.databaseHelperTV,
  });

  @override
  Future<TVTable?> getTVShowById(int id) async {
    final result = await databaseHelperTV.getTVShowById(id);
    if (result != null) {
      return TVTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TVTable>> getWatchlistTVShow() async {
    final result = await databaseHelperTV.getWatchlistTVShow();
    return result.map((data) => TVTable.fromMap(data)).toList();
  }

  @override
  Future<String> insertTVWatchlist(TVTable tv) async {
    try {
      await databaseHelperTV.insertTVWatchlist(tv);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeTVWatchlist(TVTable tv) async {
    try {
      await databaseHelperTV.removeWatchlistTv(tv);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
