import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/constants.dart';
import '../widgets/customfont.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  int numOfLikes;
  final bool hasImage;
  final String imageUrl;
  final String profileImageUrl;
  DetailScreen({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.imageUrl = '',
    this.profileImageUrl = '',
  });

  @override
  // ignore: library_private_types_in_public_api
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Customfont(
            text: widget.userName,
            fontSize: ScreenUtil().setSp(20),
            color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.imageUrl.isNotEmpty)
                Image.network(
                  widget.imageUrl,
                  width: double.infinity, 
                  fit: BoxFit.cover,
                ),

              if (widget.imageUrl.isEmpty)
                SizedBox(
                  height: ScreenUtil().setHeight(25),
                ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                  vertical: ScreenUtil().setHeight(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: ScreenUtil().setSp(25),
                      backgroundImage: NetworkImage(widget.profileImageUrl),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Username
                          Text(
                            widget.userName,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(5)),

                          // Date and Icon
                          Row(
                            children: [
                              Customfont(
                                text: widget.date,
                                fontSize: ScreenUtil().setSp(15),
                                color: Colors.grey,
                              ),
                              SizedBox(width: ScreenUtil().setWidth(5)),
                              Icon(
                                Icons.public,
                                size: ScreenUtil().setSp(18),
                                color: Colors.grey,
                              ),
                              const Spacer(),
                              const Icon(Icons.more_horiz),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                  vertical: ScreenUtil().setHeight(10),
                ),
                child: Text(
                  widget.postContent,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    color: Colors.black,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(8),
                ),
                child: Container(
                  height: 1, 
                  color: Colors.grey.shade300, 
                  width: double.infinity, 
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        widget.numOfLikes++;
                      });
                    },
                    icon: const Icon(Icons.thumb_up, color: FB_DARK_PRIMARY),
                    label: Customfont(
                      text: widget.numOfLikes == 0
                          ? 'Like'
                          : widget.numOfLikes.toString(),
                      fontSize: ScreenUtil().setSp(12),
                      color: FB_DARK_PRIMARY,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.comment, color: FB_DARK_PRIMARY),
                    label: Customfont(
                      text: 'Comment',
                      fontSize: ScreenUtil().setSp(12),
                      color: FB_DARK_PRIMARY,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.redo, color: FB_DARK_PRIMARY),
                    label: Customfont(
                      text: 'Share',
                      fontSize: ScreenUtil().setSp(12),
                      color: FB_DARK_PRIMARY,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
