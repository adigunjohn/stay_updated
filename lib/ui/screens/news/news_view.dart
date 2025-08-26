import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/custom_widgets/menu_button.dart';
import 'package:stay_updated/ui/screens/news/news_view_model.dart';

import '../../../models/news.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key, this.news});
  static const String id = 'NewsView';
  final News? news;
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Stack(
            children: [
              Container(
                height: screenHeight(context) * 0.55,
                decoration: BoxDecoration(
                  color: kCNormalGreyColor,
                  //image: DecorationImage(image: AssetImage('assets/pngs/news2.png'), fit: BoxFit.cover),
                 image: DecorationImage(image: NetworkImage(news!.urlImage), fit: BoxFit.cover, onError: (exception, stackTrace) {}),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: screenHeight(context) * 0.55,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                        Colors.transparent,],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0.0, 0.3, 0.6, 1.0],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight(context) * 0.55,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 50, bottom: 63),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MenuButton(
                            icon: Icons.arrow_back_ios_new,
                            color: Colors.black45,
                            iconColor: Colors.white,
                            onTap: () {
                              locator<NavigationService>().pop();
                            },
                          ),
                          MenuButton(
                            color: Colors.black45,
                            iconColor: Colors.white,
                            icon: Icons.bookmark_border_outlined,
                            onTap: () {
                              // do something
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      //SizedBox(height: 8,),
                      Container(
                        decoration: BoxDecoration(
                          color: kCBlueColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: Text(
                            'News',
                            style: kTBodyText1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // Text('Alexander wears modified helmet in road races', style: kTBoldSubtitleText.copyWith(fontSize: 18, color: Colors.white), maxLines: 3,),
                      Text(
                        news!.title,
                        style: kTBoldSubtitleText.copyWith(
                            fontSize: 18, color: Colors.white),
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Trending  |  ',
                            style: kTBodyText1,
                          ),
                          Text(
                            formatDateTime(news!.publishedAt),
                            style: kTBodyText1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: screenHeight(context) * 0.51,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    // color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                child: ClipOval(
                                    child: SvgPicture.asset(
                                        'assets/svgs/news.svg')),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                news!.sourceName,
                                style: kTBodyText1.copyWith(
                                    color: Theme.of(context).iconTheme.color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.verified_rounded,
                                color: kCBlueColor,
                                size: 15,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          // Text('Alexander wears modified helmet while riding a horse on his way to the Old Town Road\nAlexander wears modified helmet while riding a horse on his way to the Old Town Road\n\nAlexander wears modified helmet while riding a horse on his way to the Old Town Road\n\nAlexander wears modified helmet while riding a horse on his way to the Old Town Road\nAlexander wears modified helmet while riding a horse on his way to the Old Town Road\nAlexander wears modified helmet while riding a horse on his way to the Old Town Road\n\nAlexander wears modified helmet while riding a horse on his way to the Old Town Road\n\nAlexander wears modified helmet while riding a horse on his way to the Old Town Road\nAlexander wears modified helmet while riding a horse on his way to the Old Town Road\nAlexander wears modified helmet while riding a horse on his way to the Old Town Road\n\nAlexander wears modified helmet while riding a horse on his way to the Old Town Road',
                          //   style: kTBodyText1.copyWith(color: Theme.of(context).iconTheme.color,),),
                          Text(
                            news!.description,
                            style: kTBodyText1.copyWith(
                              color: Theme.of(context).iconTheme.color,
                            ),
                            maxLines: 15,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            news!.content,
                            style: kTBodyText1.copyWith(
                              color: Theme.of(context).iconTheme.color,
                            ),
                            maxLines: 15,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            'Written by: ${news!.author}',
                            style: kTBodyText1.copyWith(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: 13),
                            maxLines: 15,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              model.launchInBrowserView(news!.url);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: kCBlueColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5.0),
                                child: Text(
                                  'view site',
                                  style: kTBodyText1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
