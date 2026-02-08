import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return verticalSpace(30);
      },
      itemCount: 8,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: 400.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Shimmer.fromColors(
                  baseColor: ColorsManager.lightGrey,
                  highlightColor: Colors.white,
                  child: Container(width: double.infinity, color: Colors.white),
                ),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shimeerContainer(height: 30, width: 100),
                      verticalSpace(16),
                      shimeerContainer(height: 15, width: double.infinity),
                      verticalSpace(5),
                      shimeerContainer(height: 15, width: 60),
                      verticalSpace(16),
                      Row(
                        children: [
                          Column(
                            children: [
                              shimeerContainer(height: 15, width: 50),
                              verticalSpace(5),
                              shimeerContainer(height: 15, width: 50),
                            ],
                          ),
                          horizontalSpace(60),
                          Column(
                            children: [
                              shimeerContainer(height: 15, width: 50),
                              verticalSpace(5),
                              shimeerContainer(height: 15, width: 50),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  color: ColorsManager.cardFooterGrey,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          shimeerContainer(height: 20, width: 80),
                          shimeerContainer(height: 20, width: 60),
                        ],
                      ),
                      Spacer(),
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGrey,
                        highlightColor: Colors.white,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'DETAILS',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget shimeerContainer({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.lightGrey,
      highlightColor: Colors.white,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
