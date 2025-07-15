import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:law_sphere/core/function/is_arabic.dart';
import 'package:law_sphere/core/styles/app_colors.dart';
import 'package:law_sphere/core/styles/spacing.dart';
import 'package:law_sphere/core/widgets/custom_Action_Button.dart';
import 'package:law_sphere/core/widgets/custom_app_bar.dart';
import 'package:law_sphere/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(10.h)),
        SliverToBoxAdapter(
          child: CustomAppBar(
            text: S.of(context).homePage,
            needArrow: false,
            color: AppColors.inActiveDotsColor,
            textStyle: TextStyle(),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(12)),
        SliverToBoxAdapter(child: SimpleAutoSlider()),
        SliverToBoxAdapter(child: verticalSpace(50.h)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomActionButton(
                  text: S.of(context).textExplanation,
                  onPressed: () {},
                  borderRadius: 12,
                  width: 180.h,
                  height: 100.h,
                ),
                CustomActionButton(
                  text: S.of(context).videoExplanation,
                  onPressed: () {},
                  borderRadius: 12,
                  width: 180.h,
                  height: 100.h,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(40)),

        SliverToBoxAdapter(
          child: Divider(
            height: 0.60,
            endIndent: 0.05,
            thickness: 0.3,
            radius: BorderRadius.circular(12),
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            S.of(context).lectureSchedule,
            style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'GE SS TWO'),
          ),
        ),
      ],
    );
  }
}

class SimpleAutoSlider extends StatelessWidget {
  const SimpleAutoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = isArabic()
        ? ['العنصر الأول', 'العنصر الثاني', 'العنصر الثالث']
        : ['العنصر الثالث', 'العنصر الثاني', 'العنصر الأول'];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.h,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 2),
        viewportFraction: 0.85,
      ),
      items: items.map((text) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.screenBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
