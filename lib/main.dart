import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagegallerytest/bloc/post_bloc.dart';
import 'package:imagegallerytest/resources/app_colors.dart';
import 'package:imagegallerytest/ui/post_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (_context, navigator) {
        return Theme(
          data: _appTheme(_context),
          child: navigator,
        );
      },
      home: BlocProvider(
        creator: (_, context) => PostBloc(),
        child: PostsPage(),
      ),
    );
  }

  _appTheme(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ThemeData(
      appBarTheme:
          AppBarTheme(brightness: Brightness.light, color: Colors.transparent),
      dividerTheme: _dividerTheme(),
      fontFamily: 'Como',
      scaffoldBackgroundColor: AppColors.background,
      textTheme: _textTheme(),
    );
  }

  TextTheme _textTheme() {
    return TextTheme(
      subtitle1: TextStyle(
          color: AppColors.onPrimary,
          fontSize: 16.0,
          fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
          color: AppColors.onPrimary,
          fontSize: 14.0,
          fontWeight: FontWeight.w500),
    );
  }

  DividerThemeData _dividerTheme() {
    return DividerThemeData(thickness: 1.0);
  }
}
