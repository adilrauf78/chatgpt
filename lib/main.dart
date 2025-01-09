import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chatgpt/constants/colors.dart';
import 'package:chatgpt/constants/gemini_api_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view/splash_screen/splash_screen.dart';

void main() {
  Gemini.init(apiKey: Gemini_API_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return AdaptiveTheme(
          light: ThemeData.light().copyWith(
            scaffoldBackgroundColor: AppColor.white,
            primaryColor: AppColor.black,
            shadowColor: AppColor.border_color,

          ),
          dark: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.white,
            primaryColor: AppColors.black,
            shadowColor: AppColors.black,
          ),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}