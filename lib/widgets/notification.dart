import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/detail_screen.dart';

class Notification extends StatelessWidget {
  const Notification({
    super.key,
    required this.name,
    required this.post,
    required this.description,
    this.icon = const Icon(Icons.person),
    this.profileImageUrl = '',
    this.atProfile = false,
    required this.date,
    this.imageUrl = '',
    required this.numOfLikes,
  });

  final String name;
  final String post;
  final String description;
  final Icon icon;
  final String profileImageUrl;
  final String date;
  final int numOfLikes;
  final String imageUrl;
  final bool atProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(15)),
      child: InkWell(
        onTap: () {
          if (atProfile) {
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  userName: name,
                  postContent: description,
                  date: date,
                  numOfLikes: numOfLikes,
                  imageUrl: imageUrl,
                  profileImageUrl: profileImageUrl,
                ),
              ),
            );
          }
        },
        child: Row(
          children: [
            profileImageUrl == ''
                ? icon
                : CircleAvatar(
                    radius: ScreenUtil().setSp(15),
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
            SizedBox(width: ScreenUtil().setWidth(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Posted: $post',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.black,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}
