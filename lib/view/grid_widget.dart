import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final String image;
  final String name;
  const GridWidget({Key? key, required this.image, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill
              )
            ),
          ),
          Container(

            padding: EdgeInsets.all(6),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              color: Colors.grey.withOpacity(0.7),
            ),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),),
          )
        ],
      ),
    );
  }
}
