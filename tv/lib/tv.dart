library tv;

//domain - usecase
export 'domain/usecase/get_popular_tv_show.dart';
export 'domain/usecase/get_top_rated_tv_show.dart';
export 'domain/usecase/get_tv_on_the_air.dart';
export 'domain/usecase/get_tv_recommendations.dart';
export 'domain/usecase/get_tv_show_detail.dart';

//presentation
//page
export 'presentation/page/home_tv.dart';
export 'presentation/page/popular_tv_page.dart';
export 'presentation/page/top_rated_tv_page.dart';
export 'presentation/page/tv_detail_page.dart';
//provioder
export 'presentation/provider/Tv_list_notifier.dart';
export 'presentation/provider/popular_tv_notifier.dart';
export 'presentation/provider/top_rated_tv_notifier.dart';
export 'presentation/provider/tv_detail_notifier.dart';
