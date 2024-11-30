// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repos/news_repo/data_sources/news_local_data_source/news_local_data_source.dart'
    as _i661;
import '../../data/repos/news_repo/data_sources/news_remote_data_source/news_remote_data_source.dart'
    as _i1030;
import '../../data/repos/news_repo/news_repo_impl.dart' as _i937;
import '../../ui/screens/news/cubit/news_screen_cubit.dart' as _i410;
import '../repos/news_repo.dart' as _i25;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i661.NewsLocalDataSource>(() => _i661.NewsLocalDataSource());
    gh.factory<_i1030.NewsRemoteDataSource>(
        () => _i1030.NewsRemoteDataSource());
    gh.factory<_i25.NewsRepo>(() => _i937.NewsRepoImpl(
          gh<_i661.NewsLocalDataSource>(),
          gh<_i1030.NewsRemoteDataSource>(),
        ));
    gh.factory<_i410.NewsScreenCubit>(
        () => _i410.NewsScreenCubit(gh<_i25.NewsRepo>()));
    return this;
  }
}
