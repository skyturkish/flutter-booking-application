class GetStarted {
  final String page;
  final String title;
  final String content;
  GetStarted({
    required this.page,
    required this.title,
    required this.content,
  });
}

class GetStartedList {
  static List<GetStarted> pages = [
    GetStarted(
        page: 'assets/png/page1.png',
        title: 'Quick update',
        content: 'Stay informed with the fastest and most effective way, wherever you are'),
    GetStarted(
        page: 'assets/png/page2.png',
        title: 'Notify quickly',
        content: 'Receive notices about apartments, quick feedback'),
    GetStarted(
        page: 'assets/png/page3.png',
        title: 'Scan the bill',
        content: 'Quickly scan your bill when you receive your purchse invoice, or pay your utility bill'),
  ];
}
