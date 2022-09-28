import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryScreenShimmer extends StatelessWidget {
  const CategoryScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 35,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(211, 211, 211, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 35,
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(211, 211, 211, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.9 / 3,
                height: size.height * 4.5 / 6,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(211, 211, 211, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      width: size.width * 2 / 3,
                      height: size.height * 0.18 / 4,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(211, 211, 211, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      width: size.width * 2 / 3,
                      height: size.height * 0.18 / 4,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(211, 211, 211, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      width: size.width * 2 / 3,
                      height: size.height * 0.18 / 4,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(211, 211, 211, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      width: size.width * 2 / 3,
                      height: size.height * 0.18 / 4,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(211, 211, 211, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      width: size.width * 2 / 3,
                      height: size.height * 0.18 / 4,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(211, 211, 211, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      width: size.width * 2 / 3,
                      height: size.height * 0.18 / 4,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(211, 211, 211, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
