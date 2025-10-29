import 'package:cached_network_image/cached_network_image.dart';
import 'package:myapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/customfont.dart';

class CustomDialogs {
  CustomDialogs(BuildContext context, {required String title, required String content});

  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  customDialog(BuildContext context,
      {required String title, required String content}) {
    AlertDialog alertDialog = AlertDialog(
      title: Customfont(
        text: title,
        fontSize: 30.sp,
        color: Colors.black, 
      ),
      content: Customfont(
        text: content,
        color: Colors.black,
         fontSize: 30.sp 
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Customfont(
            text: 'Okay',
            color: FB_TEXT_COLOR_WHITE,
             fontSize: 30.sp
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: FB_DARK_PRIMARY,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  customShowImageDialog(BuildContext context, {required String imageUrl}) {
    AlertDialog alertDialog = AlertDialog(
      content: SizedBox(
        height: 300.h,
        child: Center(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
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
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  customOptionDialog(BuildContext context,
      {required String title,
      required String content,
      required Function onYes}) {
    AlertDialog alertDialog = AlertDialog(
      title: Customfont(
        text: title,
        fontSize: 30.sp,
        color: Colors.black,
      ),
      content: Customfont(
        text: content,
        color: Colors.black,
         fontSize: 30.sp 
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Customfont(
            text: 'No',
            color: FB_DARK_PRIMARY, 
             fontSize: 30.sp
          ),
        ),
        ElevatedButton(
          child: Customfont(
            text: 'Yes',
            color: FB_TEXT_COLOR_WHITE,
             fontSize: 30.sp
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: FB_DARK_PRIMARY,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onYes();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }
}
