import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/screens/home/home_view_model.dart';
import 'package:stay_updated/ui/screens/news/news_view.dart';

import '../../models/news_model.dart';
// import 'package:flutter/material.dart' hide CarouselController;

class CarouselWidget extends StatelessWidget {
   const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        final List<News> breakingNews = model.breakingNews;
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
          items: breakingNews.map((news) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: (){locator<NavigationService>().push(NewsView(news: news,));},
                  child: Stack(
                    children: [
                      Container(
                        width: screenWidth(context),
                        //margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          // image: const DecorationImage(image: AssetImage('assets/pngs/news2.png'), fit: BoxFit.cover),
                          image: DecorationImage(image: NetworkImage(news.urlImage), fit: BoxFit.cover),
                        ),
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(20),
                        //   child: Image.asset(url, fit: BoxFit.cover,),
                        //     // child: SvgPicture.asset(url, fit: BoxFit.cover,),
                        // ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.3),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: const [0.0, 0.4, 0.8] // Adjust stops for gradient spread
                            ),
                          ),
                        ),
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
                            child: Text('Breaking', style: kTBodyText1,),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //Text('CNN Indonesia', style: kTBodyText1,),
                                  Text(news.sourceName, style: kTBodyText1,),
                                  const SizedBox(width: 4,),
                                  const Icon(Icons.verified_rounded,color: kCBlueColor,size: 15,),
                                  //Text(' | 6hours ago', style: kTBodyText1,),
                                  Text(' | ${formatDateTime(news.publishedAt)}', style: kTBodyText1.copyWith(fontSize: 12.5),overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                width: screenWidth(context) * 0.7,
                                child: Text(news.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: kTBoldSubtitleText.copyWith(color: Colors.white), maxLines: 2,),
                              ),
                            ],
                          ),),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        );
      }
    );
  }
}
