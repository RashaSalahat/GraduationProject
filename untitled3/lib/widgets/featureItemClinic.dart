import 'package:flutter/material.dart';
import 'package:hotel_booking/api/user.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/widgets/favorite_box.dart';
import 'custom_image.dart';

class FeatureItemClinic extends StatelessWidget {
  FeatureItemClinic(
      {Key? key,
      required this.data,
      this.width = 280,
      this.height = 300,
      this.onTap,
      this.onTapFavorite})
      : super(key: key);
  final data;
  final double width;
  final double height;
  final GestureTapCallback? onTapFavorite;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    User Service = User();
    bool fav = false;

    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          //    child: FutureBuilder<List>(
          // future: Service.getAll(),
          width: width,
          height: height,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 5, top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(
                  'https://th.bing.com/th/id/R.0a06733de26c157b50cd2d72f3aac3c0?rik=E0URZZA9LzL%2fAg&pid=ImgRaw&r=0',
                  width: double.infinity,
                  height: 280,
                  radius: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            color: textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['doctor'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: labelColor, fontSize: 13),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                          FavoriteBox(
                            size: 14,
                            onTap: onTapFavorite,
                            isFavorited: fav, // هون بدي اجيب معلومة
                          )
                        ],
                      ),
                    ],

                    // },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
