import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          height: 90,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Perfect!",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Your file has been uploaded',
                        style: TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      Positioned(
        bottom: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
          child: SvgPicture.asset(
            'assets/bubbles.svg',
            height: 48,
            width: 40,
          ),
        ),
      ),
      Positioned(
          top: -19,
          left: 1,
          child: Stack(alignment: Alignment.center, children: [
            SvgPicture.asset(
              'assets/fail.svg',
              height: 40,
            ),
            Positioned(
                top: 5,
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                )

                // SvgPicture.asset(
                //   'assets/close.svg',
                //   height: 16,
                // ),
                )
          ]))
    ]);
  }
}
