import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  Widget _logo() {
    return Container(
      child: Image.asset(
        'assets/images/logo.png',
        width: 130,
      ),
    );
  }

  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            width: 23,
            height: 23,
            child: SvgPicture.asset('assets/svg/icons/bell.svg'),
          ),
          onTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            child: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset('assets/svg/icons/search.svg'),
            ),
            onTap: () {
              Get.toNamed('/search');
            },
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.5),
          backgroundImage: Image.network(
                  'https://yt3.ggpht.com/ytc/AMLnZu-lGth6cjgZLoMHigawHJ0s3NNvsXXGoC0J3PBD=s88-c-k-c0x00ffffff-no-rj')
              .image,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logo(),
          _actions(),
        ],
      ),
    );
  }
}
