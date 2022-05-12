import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class ChatAndAddToCart extends StatelessWidget {
  const ChatAndAddToCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.all(100.0),
      // padding: EdgeInsets.symmetric(
      //   horizontal: kDefaultPadding,
      //   vertical: kDefaultPadding / 2,
      // ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.white, Color(0xff8f93ea)]),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          //SizedBox(width:  200),

          FlatButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/shopping-bag.svg",
              height: 18,
              color: Color(0xffffae88),
            ),
            label: Text(
              "Add to Cart",
              style: TextStyle(color: Color(0xffffae88)),
            ),
          ),
        ],
      ),
    );
  }
}
