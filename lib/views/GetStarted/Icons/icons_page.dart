import 'package:flutter/material.dart';
import 'package:flutter_booking_application/product/Utilities/Colors/colors.dart';
import 'package:flutter_booking_application/views/GetStarted/Icons/icons_page_view_model.dart';
import 'package:provider/provider.dart';

class IconsView extends StatefulWidget {
  const IconsView({Key? key, required this.number}) : super(key: key);
  final int number;

  @override
  State<IconsView> createState() => _IconsViewState();
}

class _IconsViewState extends State<IconsView> {
  Color selectedColor = ColorsUtilities.darkGreenBlue;
  Color unSelectedColor = ColorsUtilities.greyish;
  @override
  Widget build(BuildContext context) {
    const double defautSize = 24.0;
    int currentPage = context.watch<IconsPageViewModel>().pageCount;
    return SizedBox(
      height: defautSize,
      width: widget.number * defautSize,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.number,
          itemBuilder: (context, index) {
            return Icon(
              Icons.circle,
              color: currentPage == index ? selectedColor : unSelectedColor,
            );
          }),
    );
  }
}
