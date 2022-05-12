import 'package:hotel_booking/data_fitness/water_intake.dart';
import 'package:hotel_booking/theme_fitness/colors.dart';
import 'package:flutter/material.dart';

class WaterIntakeTimeLine extends StatelessWidget {
  const WaterIntakeTimeLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(waterIntakeJson.length, (index) {
        if(index != waterIntakeJson.length - 1){
            return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 8,
              decoration: BoxDecoration(
                color: thirdColor,
                shape: BoxShape.circle
              ),
            ),
            SizedBox(width: 6,),
            Text(
             waterIntakeJson[index],
              style: TextStyle(
                  fontSize: 12,
                  color: black.withOpacity(0.5)),
            ),
          ],
        ),
        SizedBox(height: 2,),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Container(
            height: 25,
            width: 1,
            decoration: BoxDecoration(
              color: thirdColor
            ),
          ),
        ),
        SizedBox(height: 2,),
      ],
    );
        }
        else {
          return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: thirdColor,
                shape: BoxShape.circle
              ),
            ),
            SizedBox(width: 6,),
            Text(
             waterIntakeJson[index],
              style: TextStyle(
                  fontSize: 12,
                  color: black.withOpacity(0.5)),
            ),
          ],
        ),
      ],
    );
        }
      }),
    );
  }
}