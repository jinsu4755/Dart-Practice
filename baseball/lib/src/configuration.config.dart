// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:baseball/src/domain/auto_baseball_numbers_generator.dart'
    as _i6;
import 'package:baseball/src/domain/baseball_numbers_generator.dart' as _i5;
import 'package:baseball/src/domain/batter_player.dart' as _i3;
import 'package:baseball/src/domain/picther_player.dart' as _i7;
import 'package:baseball/src/presentation/baseball_game_manager.dart' as _i9;
import 'package:baseball/src/presentation/computer_picther_player.dart' as _i8;
import 'package:baseball/src/presentation/manual_batter_player.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.BatterPlayer>(() => _i4.ManualBatterPlayer());
    gh.factory<_i5.BaseBallNumbersGenerator>(
        () => _i6.AutoBaseBallNumbersGenerator());
    gh.factory<_i7.PictherPlayer>(() =>
        _i8.AutoPicherPlayer(generator: gh<_i5.BaseBallNumbersGenerator>()));
    gh.factory<_i9.BaseballGameManager>(() => _i9.BaseballGameManager(
          picther: gh<_i7.PictherPlayer>(),
          batter: gh<_i3.BatterPlayer>(),
        ));
    return this;
  }
}
