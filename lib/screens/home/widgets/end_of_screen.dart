import 'package:flutter/material.dart';

class BottomTag extends StatelessWidget {
  const BottomTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1,
            width: 60,
            color: Colors.grey.shade400,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'You\'ve reached the end of the page',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Container(
            height: 1,
            width: 60,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}
