import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/notification.dart' as notif;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      child: ListView(
        children: const [
          notif.Notification(
            name: 'MattG',
            post: 'post',
            description: 'happi bday',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtMUYZVFXWV8jP07Udy9HrE_Gz4f6AVpY3zsi4nTxrJ1nrhT0FUx_OVHqpCG1g-x_OcqA&usqp=CAU',
            date: 'Aug 12,2022',
            numOfLikes: 0,
            profileImageUrl: 'https://versetracker.com/sites/default/files/rapper-pictures/b/badang.jpg',
          ),
          Divider(),
          notif.Notification(
            name: 'JamesG',
            post: 'post',
            description: 'arf',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9Pe68oq409W00aqhW1tJtuHSUng_4Zk265g&s',
            date: 'Feb 13,2023',
            numOfLikes: 0,
            profileImageUrl: 'https://media.gq.com/photos/5582c6ede52bc4b477a9d383/master/w_320%2Cc_limit/copilot-entertainment-celebrities-201307-bald-verne-troyer.jpg',
          ),
          Divider(),
          notif.Notification(
            name: 'JustinG',
            post: 'post',
            description: 'gg sir',
            imageUrl: 'https://th.bing.com/th/id/OIP.7rNs4GlXtPA2qhvFfRONlQHaEo?rs=1&pid=ImgDetMain',
            date: 'Sept 14,2021',
            numOfLikes: 0,
            profileImageUrl: 'https://preview.redd.it/early-elon-and-his-receding-hair-line-v0-jdm524gjeurd1.jpeg?width=640&crop=smart&auto=webp&s=c91fbd62e04dc0811a42efc6138b25b2463f1efa',
          ),
          Divider(),
          notif.Notification(
            name: 'RomeG',
            post: 'post',
            description: 'awits',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBIO3mtHvIj5NTKIVX9qQVcu98ISPYesuK5g&s',
            date: 'Oct 15,2020',
            numOfLikes: 0,
            profileImageUrl: 'https://bloximages.chicago2.vip.townnews.com/utdailybeacon.com/content/tncms/assets/v3/editorial/7/bd/7bd503d0-74d1-11ed-9431-5b3f51688c70/638e4504b235e.image.png?resize=1200%2C797',
          ),
          Divider(),
        ],
      ),
    );
  }
}
