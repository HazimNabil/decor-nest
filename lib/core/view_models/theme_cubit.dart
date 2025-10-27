import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _loadCachedTheme();
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    emit(themeMode);
    await CacheHelper.setData<String>(CacheConstants.themeMode, themeMode.name);
  }

  Future<void> _loadCachedTheme() async {
    final themeModeName = await CacheHelper.getString(
      CacheConstants.themeMode,
      defaultValue: ThemeMode.system.name,
    );
    final themeMode = ThemeMode.values.byName(themeModeName);
    emit(themeMode);
  }
}
