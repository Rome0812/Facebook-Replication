import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/detail_screen.dart';
import 'package:myapp/widgets/custom_inkwell_button.dart';

import '../constants.dart';
import '../widgets/customfont.dart';

// ignore: must_be_immutable
class PostCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String profileImageUrl;
  final String date;
  int numOfLikes;
  final bool hasImage;
  final String imageUrl;
  final String adsMarket;
  final bool isAds;

  PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.profileImageUrl,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.imageUrl = '',
    this.adsMarket = '',
    this.isAds = true,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            userName: widget.userName,
            postContent: widget.postContent,
            date: widget.date,
            imageUrl: widget.imageUrl,
            profileImageUrl: widget.profileImageUrl,
            numOfLikes: widget.numOfLikes,
          ),
        ),
      ),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  (widget.profileImageUrl == '')
                      ? const Icon(Icons.person)
                      : ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 30,
                            height: 30,
                            imageUrl: widget.profileImageUrl,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        color: FB_DARK_PRIMARY,
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              size: 100.sp,
                            ),
                          ),
                        ),
                  SizedBox(width: ScreenUtil().setSp(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Customfont(
                        text: widget.userName,
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          Customfont(
                            text: widget.date,
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.grey,
                          ),
                          SizedBox(width: ScreenUtil().setWidth(3)),
                          Icon(
                            Icons.public,
                            size: ScreenUtil().setSp(15),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),

              // Post content
              Customfont(
                text: widget.postContent,
                fontSize: ScreenUtil().setSp(12),
                color: Colors.black,
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),
              (widget.imageUrl == '')
                  ? SizedBox(height: ScreenUtil().setHeight(0.1))
                  : Align(
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        imageUrl: widget.imageUrl,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                          color: FB_DARK_PRIMARY,
                          value: downloadProgress.progress,
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          size: 100.sp,
                        ),
                      ),
                    ),

              SizedBox(height: ScreenUtil().setHeight(5)),
              (widget.adsMarket != '')
                  ? const SizedBox()
                  // Like, Comment, and Share buttons
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              widget.numOfLikes++;
                            });
                          },
                          icon: const Icon(Icons.thumb_up,
                              color: FB_DARK_PRIMARY),
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
                          icon:
                              const Icon(Icons.comment, color: FB_DARK_PRIMARY),
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

              (widget.adsMarket != '')
                  ? Container(
                      padding: EdgeInsets.all(5.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Customfont(
                                text: 'MORE DETAILS',
                                fontSize: 17.sp,
                                color: Colors.black,
                              ),
                              Customfont(
                                text: widget.adsMarket,
                                fontSize: 17.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          CustomInkwellButton(
                            width: 90.w,
                            height: 40.h,
                            icon: const Icon(
                              Icons.arrow_right_alt,
                              color: FB_LIGHT_PRIMARY,
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  userName: widget.userName,
                                  postContent: widget.postContent,
                                  date: widget.date,
                                  imageUrl: widget.imageUrl,
                                  profileImageUrl: widget.profileImageUrl,
                                  numOfLikes: widget.numOfLikes,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),

              // Comment Section
              (widget.adsMarket != '')
                  ? const SizedBox()
                  : SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
              (widget.adsMarket != '')
                  ? const SizedBox()
                  : Customfont(
                      text: 'View Comments',
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.bold,
                      color: Colors.black)
            ],
          ),
        ),
      ),
    );
  }
}
