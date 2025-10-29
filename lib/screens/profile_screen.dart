import 'package:myapp/constants.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:myapp/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/post_card.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatefulWidget {
  final String username;

  const ProfileScreen({
    super.key,
    this.username = '',
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.HkI_xPmiRDReWJ32ASNYRAHaEK?rs=1&pid=ImgDetMain',
                    imageBuilder: (context, imageProvider) => Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        color: FB_DARK_PRIMARY,
                        value: downloadProgress.progress,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 200,
                      color: Colors.grey[300], // Fallback color
                      child: Center(
                        child: Icon(
                          Icons.error,
                          size: 100.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: ScreenUtil().setWidth(20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        (NetworkImage ==
                                'https://th.bing.com/th/id/OIP.VJyfsC9KfAxC5avkfkhdxQHaNJ?rs=1&pid=ImgDetMain')
                            ? const Icon(Icons.person)
                            : ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: 100, // Adjust size as needed
                                  height: 100,
                                  imageUrl:
                                      'https://th.bing.com/th/id/OIP.VJyfsC9KfAxC5avkfkhdxQHaNJ?rs=1&pid=ImgDetMain',
                                  progressIndicatorBuilder: (context, url,
                                          downloadProgress) =>
                                      CircularProgressIndicator(
                                          color:
                                              FB_DARK_PRIMARY, // Adjust color as needed
                                          value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    size: 30, // Adjust size as needed
                                  ),
                                ),
                              ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(55)),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customfont(
                      text: widget.username,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.black,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    Row(
                      children: [
                        Customfont(
                          text: '1M',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        Customfont(
                          text: 'Followers',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.blue,
                          fontWeight: FontWeight.w100,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        Icon(Icons.circle,
                            size: ScreenUtil().setSp(5), color: Colors.grey),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        Customfont(
                          text: '400k',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        Customfont(
                          text: 'Following',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.blue,
                          fontWeight: FontWeight.w100,
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Row(children: [
                      CustomButton(
                        buttonName: 'Follow',
                        onPressed: () {},
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      CustomButton(
                        buttonName: 'Message',
                        onPressed: () {},
                        buttonType: 'outlined',
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              TabBar(
                indicatorColor: FB_DARK_PRIMARY,
                tabs: [
                  Tab(
                    child: Customfont(
                      text: 'Posts',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    child: Customfont(
                      text: 'About',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    child: Customfont(
                      text: 'Photos',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(2000),
                child: TabBarView(
                  children: [
                    _post(),
                    _about(),
                    _photos(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _post() {
    return Column(
      children: [
        PostCard(
          userName: 'Joji Revillame',
          postContent: 'bigyan ng jacket chan!',
          profileImageUrl: 'https://i.namu.wiki/i/Mn7pcmEHM3zu0w8XV10qAfgCL9RqT64p7p-ZtfaXKwNgnsTvfX37-IgK4ZJiSTfSQ6g7rXCbJrqJZnunpOP8lg.webp',
          date: 'Dec 10, 2024',
          imageUrl:
              'https://raw.githubusercontent.com/arialhamed/static/main/images/d57ceb9546385b8d5c224c34502ddcf6.jpg',
          numOfLikes: 100,
          hasImage: true,
        ),
        PostCard(
          userName: 'Matti G',
          postContent: 'Poge!',
          profileImageUrl: 'https://versetracker.com/sites/default/files/rapper-pictures/b/badang.jpg',
          date: 'Nov 3, 2023',
          imageUrl:
              'https://raw.githubusercontent.com/arialhamed/static/main/images/d57ceb9546385b8d5c224c34502ddcf6.jpg',
          numOfLikes: 100,
          hasImage: true,
        ),
        PostCard(
          userName: 'Jame G',
          postContent: 'For YOu bboi',
          profileImageUrl: 'https://media.gq.com/photos/5582c6ede52bc4b477a9d383/master/w_320%2Cc_limit/copilot-entertainment-celebrities-201307-bald-verne-troyer.jpg',
          date: 'Aug 12, 2026',
          imageUrl:
              'https://th.bing.com/th/id/OIP.u2wwXZricEbeUdOzLZl1gQAAAA?w=346&h=450&rs=1&pid=ImgDetMain',
          numOfLikes: 100,
          hasImage: true,
        ),
      ],
    );
  }

  Widget _about() {
    return ListView(
      padding: EdgeInsets.all(ScreenUtil().setSp(20)),
      children: [
        // Title
        Text(
          'ABOUT ME',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: ScreenUtil().setSp(10)),
        Text(
          'I\'m Jerrome Bato, a 3rd Year BSIT student, specialization in mobile and web application.',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
            color: Colors.black,
          ),
        ),
        SizedBox(height: ScreenUtil().setSp(10)),

        Row(
          children: [
            Icon(Icons.school_rounded,
                color: Colors.black, size: ScreenUtil().setSp(20)),
            SizedBox(width: ScreenUtil().setSp(10)),
            Text(
              'School: National University Manila',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: ScreenUtil().setSp(10)),
        Row(
          children: [
            Icon(Icons.location_city_rounded,
                color: Colors.pink, size: ScreenUtil().setSp(20)),
            SizedBox(width: ScreenUtil().setSp(10)),
            Text(
              'Location: Cainta Rizal',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.black,
              ),
            ),
          ],
        ),
        Divider(height: ScreenUtil().setSp(30)),
      ],
    );
  }

  Widget _photos() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            child: Image.network(
              'https://th.bing.com/th/id/R.62325205054ee42cbd441c7036a7e3ec?rik=zO5OmwzyqCJFHQ&riu=http%3a%2f%2fcdn.ebaumsworld.com%2fmediaFiles%2fpicture%2f1151541%2f84693449.png&ehk=vM0aW%2bAO3L3zjYVMYfQVJVnKYkhHNG5%2fcmOIIunjCFk%3d&risl=&pid=ImgRaw&r=0',
              fit: BoxFit.cover,
            ),
            onTap: () => customShowImageDialog(context,
                imageUrl:
                    'https://th.bing.com/th/id/R.62325205054ee42cbd441c7036a7e3ec?rik=zO5OmwzyqCJFHQ&riu=http%3a%2f%2fcdn.ebaumsworld.com%2fmediaFiles%2fpicture%2f1151541%2f84693449.png&ehk=vM0aW%2bAO3L3zjYVMYfQVJVnKYkhHNG5%2fcmOIIunjCFk%3d&risl=&pid=ImgRaw&r=0'),
          ),
          GestureDetector(
            child: Image.network(
              'https://th.bing.com/th/id/OIP.nYSR_27952477tIrc3-OYwHaEx?rs=1&pid=ImgDetMain',
              fit: BoxFit.cover,
            ),
            onTap: () => customShowImageDialog(context,
                imageUrl:
                    'https://th.bing.com/th/id/OIP.nYSR_27952477tIrc3-OYwHaEx?rs=1&pid=ImgDetMain'),
          ),
          GestureDetector(
            child: Image.network(
              'https://th.bing.com/th/id/OIP.u2wwXZricEbeUdOzLZl1gQAAAA?w=346&h=450&rs=1&pid=ImgDetMain',
              fit: BoxFit.cover,
            ),
            onTap: () => customShowImageDialog(context,
                imageUrl:
                    'https://th.bing.com/th/id/OIP.u2wwXZricEbeUdOzLZl1gQAAAA?w=346&h=450&rs=1&pid=ImgDetMain'),
          ),
          GestureDetector(
            child: Image.network(
              'https://th.bing.com/th/id/OIP.QKdnkBmynu1I11Ij_iR_XwAAAA?rs=1&pid=ImgDetMain',
              fit: BoxFit.cover,
            ),
            onTap: () => customShowImageDialog(context,
                imageUrl:
                    'https://th.bing.com/th/id/OIP.QKdnkBmynu1I11Ij_iR_XwAAAA?rs=1&pid=ImgDetMain'),
          ),
        ],
      ),
    );
  }

  void customShowImageDialog(BuildContext context, {required String imageUrl}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                  splashRadius: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
