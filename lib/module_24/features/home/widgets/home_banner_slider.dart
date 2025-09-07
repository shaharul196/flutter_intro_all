import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({
    super.key,
  });

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  // int _currentIndex = 0;
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            // aspectRatio: 16/9,
            viewportFraction: 1,
            // autoPlay: true,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              _currentIndex.value = index;
            },
          ),
          items:
          [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0),
                  ),
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i<5; i++)
                  Container(
                    width: 13,
                    height: 13,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: value == i ? AppColors.themeColor : null,
                      border: Border.all(color: Colors.grey)
                    ),
                  )
              ],
            );
          }
        )
      ],
    );
  }
}
