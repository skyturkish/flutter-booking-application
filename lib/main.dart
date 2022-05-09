import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/GetStarted/Icons/icons_page_view_model.dart';
import 'views/GetStarted/model/get_started_model.dart';
import 'views/GetStarted/view/page_view.dart';

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
        title: 'Apart App',
        home: MainPageView(
          pages: GetStartedList.pages,
        ));
  }
}
