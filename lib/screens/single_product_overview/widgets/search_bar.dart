import 'package:flutter/material.dart';

import '../../core/widgets/search_delegate.dart';

class ProdDetailAppBar extends StatelessWidget {
  const ProdDetailAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: MySearchDelegate(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: double.infinity,
        height: 36,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(211, 211, 211, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        child: Center(
          child: Row(
            children: const [
              Icon(
                Icons.search,
                color: Colors.black45,
              ),
              Text(
                'Search Products',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
