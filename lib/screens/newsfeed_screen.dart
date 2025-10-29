import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/post_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // NewsFeed Post
        PostCard(
          userName: 'Joji Revillame',
          postContent: 'Sad reacts only',
          profileImageUrl: 'https://i.namu.wiki/i/Mn7pcmEHM3zu0w8XV10qAfgCL9RqT64p7p-ZtfaXKwNgnsTvfX37-IgK4ZJiSTfSQ6g7rXCbJrqJZnunpOP8lg.webp',
          date: 'Dec 10, 2024',
          imageUrl:
              'https://raw.githubusercontent.com/arialhamed/static/main/images/d57ceb9546385b8d5c224c34502ddcf6.jpg',
          hasImage: true,
        ),
        // Advertisement
        _buildAdvertisement(),

        PostCard(
          userName: 'Niki Minaj',
          postContent: 'I am the best',
          profileImageUrl: 'https://i.pinimg.com/originals/bc/17/11/bc171194fc829e317d0c5ad9cb1aa12f.jpg',
          date: 'Nov 10, 2024',
          numOfLikes: 2,
          imageUrl:
              'https://th.bing.com/th/id/OIP.7rNs4GlXtPA2qhvFfRONlQHaEo?rs=1&pid=ImgDetMain',
          hasImage: false,
        ),
        _buildAdvertisement(),

        PostCard(
          userName: 'Brian Nuel',
          postContent: 'Let’s go!',
          profileImageUrl: 'https://cdn.tatlerasia.com/tatlerasia/i/2021/11/25144457-rich-brian-final1_cover_1000x1500.jpg',
          date: 'Aug 10, 2024',
          numOfLikes: 1000,
          imageUrl:
              'https://api.memegen.link/images/both/width_or_height/why_not_both~q.png?height=450&width=800',
          hasImage: false,
        ),
        _buildAdvertisement(),

        PostCard(
          userName: 'Michael Jordan',
          postContent: 'I am the GOAT',
          profileImageUrl: 'https://www.usmagazine.com/wp-content/uploads/2023/04/michael-jordan-through-the-years-14.jpg?quality=70&strip=all',
          date: 'Sept 10, 2024',
          numOfLikes: 30000,
          imageUrl:
              'https://th.bing.com/th/id/OIP.KpAfjTRCSlaiSVrcjSiYxgHaEp?rs=1&pid=ImgDetMain',
          hasImage: false,
        ),
        _buildAdvertisement(),
      ],
    );
  }

  Widget _buildAdvertisement() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Center(
            child: Text(
              'Advertisement / Promotion',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              height: 302.h,
              padEnds: false,
              viewportFraction:
                  0.9, // Ensures images fit within the screen width
            ),
            items: carouselItems().map((item) {
              return ClipRRect(
                borderRadius:
                    BorderRadius.circular(10.r), // Optional: Rounded corners
                child: Container(
                  width: double
                      .infinity, // Ensures item takes full width of the carousel slot
                  child: item,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

List<Widget> carouselItems() {
  return [
    PostCard(
      userName: 'Jerrome Bato',
      postContent: 'Check this out!',
      profileImageUrl: 'https://i.pinimg.com/736x/21/61/28/216128bca8990dabf4dcdfd336b3dac7.jpg',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Cat_November_2010-1a_%28cropped_2023%29.jpg/124px-Cat_November_2010-1a_%28cropped_2023%29.jpg',
      date: 'January 2025',
      isAds: true,
      adsMarket: 'Special Offer!',
    ),
    PostCard(
      userName: 'Jakiro',
      postContent: 'Don’t miss this deal!',
      profileImageUrl: 'https://i.namu.wiki/i/Mn7pcmEHM3zu0w8XV10qAfgCL9RqT64p7p-ZtfaXKwNgnsTvfX37-IgK4ZJiSTfSQ6g7rXCbJrqJZnunpOP8lg.webp',
      date: 'January 2025',
      isAds: true,
      adsMarket: 'Limited Time',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/archive/3/3a/20090207230033%21Cat03.jpg/120px-Cat03.jpg',
    ),
    PostCard(
      userName: 'Balanar',
      postContent: 'Best Prices!',
      profileImageUrl: 'https://i.pinimg.com/originals/bc/17/11/bc171194fc829e317d0c5ad9cb1aa12f.jpg',
      date: 'January 2025',
      isAds: true,
      adsMarket: 'Sale Event',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/archive/4/42/20131224184649%21Cat_December_2009-1.jpg/91px-Cat_December_2009-1.jpg',
    ),
    PostCard(
      userName: 'Kim',
      postContent: 'Hurry up!',
      profileImageUrl: 'https://cdn.tatlerasia.com/tatlerasia/i/2021/11/25144457-rich-brian-final1_cover_1000x1500.jpg',
      date: 'January 2025',
      isAds: true,
      adsMarket: 'Big Discount',
      imageUrl:
          'https://secure.gravatar.com/avatar/cbb9b2dae6c3de2e49df9406e788a105efb81abee0c821af7bcf492592adea8a?s=100&d=retro&r=g',
    ),
    PostCard(
      userName: 'Kwan',
      postContent: 'Check our new collection!',
      profileImageUrl: 'https://www.usmagazine.com/wp-content/uploads/2023/04/michael-jordan-through-the-years-14.jpg?quality=70&strip=all',
      date: 'January 2025',
      isAds: true,
      adsMarket: 'New Arrival',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/KotR.jpg/120px-KotR.jpg',
    ),
  ];
}
