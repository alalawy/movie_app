import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  ShimmerWidget({super.key, this.width, this.height, this.radius});

  double? width;
  double? height;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[900]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(radius ?? 0)),
        ),
      ),
    );
  }
}

class DetailMovieShimmer extends StatelessWidget {
  const DetailMovieShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerWidget(
          width: double.infinity,
          height: Get.size.height * 0.6,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerWidget(
                width: 100,
                height: 30,
              ),
              ShimmerWidget(
                width: 100,
                height: 30,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ShimmerWidget(
            width: double.infinity,
            height: 35,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ShimmerWidget(
            width: double.infinity,
            height: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ShimmerWidget(
                      width: double.infinity,
                      height: 10,
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
