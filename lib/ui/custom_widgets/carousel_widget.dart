import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/screens/home/home_view_model.dart';
// import 'package:flutter/material.dart' hide CarouselController;

class CarouselWidget extends StatelessWidget {
   const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return CarouselSlider(
          options: CarouselOptions(
            height: 220,
            //aspectRatio: 16/9,
            viewportFraction: 0.85,
            onPageChanged: (index, reason){
              model.updateCarouselIndex(index);
            },
            padEnds: true,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: model.carouselImages.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                      width: screenWidth(context),
                      //margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(image: AssetImage('assets/pngs/news2.png'), fit: BoxFit.cover),
                      ),
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(20),
                      //   child: Image.asset(url, fit: BoxFit.cover,),
                      //     // child: SvgPicture.asset(url, fit: BoxFit.cover,),
                      // ),
                    ),
                    Positioned(
                      top: 15,
                      left: 15,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kCBlueColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                          child: Text('Sports', style: kTBodyText1,),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 15,
                        bottom: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('CNN Indonesia', style: kTBodyText1,),
                                SizedBox(width: 4,),
                                Icon(Icons.verified_rounded,color: kCBlueColor,size: 15,),
                                Text(' | 6hours ago', style: kTBodyText1,),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              width: screenWidth(context) * 0.7,
                              child: Text('Alexander wears modified helmet while riding a horse on his way to the Old Town Road',
                                overflow: TextOverflow.ellipsis,
                                style: kTBoldSubtitleText.copyWith(color: Colors.white), maxLines: 2,),
                            ),
                          ],
                        ),),
                  ],
                );
              },
            );
          }).toList(),
        );
      }
    );
  }
}
