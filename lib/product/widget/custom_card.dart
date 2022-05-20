import 'dart:io';

import 'package:dio/dio.dart';
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
  late final Dio _dio;
  String? path;

  final String defaultPicture =
      'https://media.istockphoto.com/photos/european-short-haired-cat-picture-id1072769156?k=20&m=1072769156&s=612x612&w=0&h=k6eFXtE7bpEmR2ns5p3qe_KYh098CVLMz4iKm5OuO6Y=';
  @override
  void initState() {
    _dio = Dio();
    getPicturePath();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getPicturePath() async {
    bool isFailed = false;
    Response? response;
    try {
      response = await _dio
          .get(widget.post?.postUserModel?.image ?? '  https://robohash.org/utnonnobis.png?size=50x50&set=set1');
    } catch (e) {
      isFailed = true;
    }

    if (!isFailed) {
      if (response!.statusCode == HttpStatus.ok) {
        path = widget.post!.postUserModel!.image!;
      }
    } else {
      path = defaultPicture;
    }
    if (mounted) {
      setState(() {
        // Your state change code goes here
      });
    }
  }

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
                      CircleAvatar(backgroundImage: NetworkImage(path ?? defaultPicture)),
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
