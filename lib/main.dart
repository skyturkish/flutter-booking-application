import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_booking_application/views/Login/view/login_view.dart';
import 'package:provider/provider.dart';

import 'views/GetStarted/Icons/icons_page_view_model.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => IconsPageViewModel())],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
                  // statusBarBrightness: Brightness.light, // For iOS (dark icons)
                  // systemNavigationBarIconBrightness: Brightness.dark,
                  ))),
      title: 'Apart App',

      home: const LoginView(),
      // home: GetStartedView(
      //   pages: GetStartedList.pages,
      // ),
    );
    // home: MainPageView(
    //   pages: GetStartedList.pages,
    // ));
  }
}
