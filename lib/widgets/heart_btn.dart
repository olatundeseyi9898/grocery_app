import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class HeartBTN extends StatefulWidget {
  HeartBTN({
    Key? key,
  }) : super(key: key);

  @override
  State<HeartBTN> createState() => _HeartBTNState();
}

class _HeartBTNState extends State<HeartBTN> {
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {
        setState(() {
          isclicked = !isclicked;
        });
      },
      child: Icon(
        isclicked ? Icons.favorite : Icons.favorite_outline,
        // IconlyLight.heart,
        size: 22,
        color: isclicked ? Colors.red : Colors.white,
      ),
    );
  }
}
