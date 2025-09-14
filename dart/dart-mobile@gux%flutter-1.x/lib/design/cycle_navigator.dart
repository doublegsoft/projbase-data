
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/design/common.dart';

class CycleNavigator extends StatefulWidget {

  final List data;

  final ItemedWidgetBuilder builder;

  double? height;

  CycleNavigator({
    required this.data,
    required this.builder,
    this.height = 180,
  });

  @override
  State<StatefulWidget> createState() => CycleNavigatorState();

}

class CycleNavigatorState extends State<CycleNavigator> {

  final CarouselSliderController _carouselSliderController = CarouselSliderController();

  final ValueNotifier<int> _currentCarouselableIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              _currentCarouselableIndex.value = index;
            },
          ),
          carouselController: _carouselSliderController,
          items: widget.data.map((item) => widget.builder(context, item)).toList(),
        ),
        Positioned(
          right: 10,
          bottom: 0,
          child: ValueListenableBuilder<int>(
            valueListenable: _currentCarouselableIndex,
            builder: (context, current, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.data.length, (index) {
                  return GestureDetector(
                    onTap: () => _carouselSliderController.animateToPage(index),
                    child: Container(
                      width: 4,
                      height: 4,
                      margin: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: current == index ? const Color(0xff560B5E) : Colors.white,
                      ),
                    ),
                  );
                },),
              );
            },
          ),
        ),
      ],
    );
  }

}