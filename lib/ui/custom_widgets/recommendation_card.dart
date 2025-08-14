import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/models/news_model.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/screens/news/news_view.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          locator<NavigationService>().push(NewsView(
            news: news,
          ));
        },
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: kCNormalGreyColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  news.urlImage,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Container(
                      height: 120,
                      width: 120,
                      color: kCNormalGreyColor,
                      child:  Center(child: Icon(Icons.broken_image, color: Colors.grey[600], size: 40)),
                    );
                  },
                ),
                // SvgPicture.asset('assets/svgs/news.svg', fit: BoxFit.cover,)
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 120,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('Sports', style: kTBodyText1.copyWith(color: kCNormalGreyColor),),
                  Text(
                    news.sourceName,
                    style: kTBodyText1.copyWith(color: kCNormalGreyColor),
                  ),
                  // Text('What Training Do Volleyball Players Need?', style: kTTitleText.copyWith(fontSize: 16.3),),
                  Text(
                    news.title,
                    style: kTTitleText.copyWith(fontSize: 16.3),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        child: ClipOval(
                          child: SvgPicture.asset('assets/svgs/news.svg'),
                        ),
                      ),
                      //Text('  McKindney  ', style: kTBodyText1.copyWith(color: kCNormalGreyColor),),
                      Expanded(
                          child: Text(
                        '  ${news.author}  ',
                        style: kTBodyText1.copyWith(color: kCNormalGreyColor),
                        overflow: TextOverflow.ellipsis,
                      )),
                      //Text('|  Oct 14, 2024', style: kTBodyText1.copyWith(color: kCNormalGreyColor),),
                    ],
                  ),
                  Text(
                    '|  ${formatDateTime(news.publishedAt)}',
                    style: kTBodyText1.copyWith(color: kCNormalGreyColor, fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
