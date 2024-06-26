import 'package:flutter/material.dart';



class sqrTile extends StatelessWidget {
  final String url;
  final Function()? tap;
  const sqrTile({super.key,required this.url,required this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
          height: 80,
          width: 80,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            image: AssetImage(url)
          )
        ),
      ),
    );
  }
}
