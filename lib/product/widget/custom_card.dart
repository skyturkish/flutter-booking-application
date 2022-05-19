import 'package:flutter/material.dart';
import 'package:flutter_booking_application/views/HomePage/model/post_model.dart';

class CardPost extends StatefulWidget {
  const CardPost({
    Key? key,
    required this.post,
    // required this.user,
  }) : super(key: key);
  final PostModel? post;
//  final LoginModel user;
  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * (150 / 812),
        width: MediaQuery.of(context).size.width * (259 / 375),
        child: widget.post == null
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                          //    foregroundImage: NetworkImage(widget.user.image!)
                          ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          // Text(widget.user.firstName!),
                          //Text(widget.user.lastName!),
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
                    ],
                  ),
                  SizedBox(height: 50, child: ListView(children: [Text(widget.post!.body!)])),
                  Row(
                    children: [const Icon(Icons.comment), Text(' Comment ${widget.post!.reactions}')],
                  )
                ],
              ),
      ),
    );
  }
}
