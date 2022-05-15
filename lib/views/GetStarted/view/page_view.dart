import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'get_started_page.dart';
import '../Icons/icons_page_view_model.dart';
import '../model/get_started_model.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({Key? key, required this.pages}) : super(key: key);
  final List<GetStarted> pages;
  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageView.builder(
        onPageChanged: (value) {
          context.read<IconsPageViewModel>().changePageCount(value);
        },
        itemCount: widget.pages.length,
        itemBuilder: (BuildContext context, int index) {
          return GetStartedBuilder(getStarted: widget.pages[index]);
        },
      )),
    );
  }
}
