import 'package:flutter/material.dart';
import 'package:flutter_grocer_app/core/config/config.dart';
import 'package:flutter_grocer_app/core/providers/slider_provider.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FeaturedSliders extends StatefulWidget {
  const FeaturedSliders({
    Key key,
  }) : super(key: key);

  @override
  _FeaturedSlidersState createState() => _FeaturedSlidersState();
}

class _FeaturedSlidersState extends State<FeaturedSliders> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sliders = Provider.of<SlidersProvider>(context);
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: 130,
      ),
      items: sliders.slidersList
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Image.network(
                    "${item.imageUrl}",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
