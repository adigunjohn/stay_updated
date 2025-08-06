import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/screens/news/news_view.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: (){
          locator<NavigationService>().pushNamed(NewsView.id);
        },
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
           ),
           child: ClipRRect(
               borderRadius: BorderRadius.circular(15),
               child: SvgPicture.asset('assets/svgs/news.svg', fit: BoxFit.cover,)),
            ),
            const SizedBox(width: 10,),
            SizedBox(
              height: 120,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sports', style: kTBodyText1.copyWith(color: kCNormalGreyColor),),
                  Text('What Training Do Volleyball Players Need?',
                    style: kTTitleText.copyWith(fontSize: 16.3),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        child: ClipOval(child: SvgPicture.asset('assets/svgs/news.svg')),
                      ),
                      Text('  McKindney  ', style: kTBodyText1.copyWith(color: kCNormalGreyColor),),
                      Text('|  Oct 14, 2024', style: kTBodyText1.copyWith(color: kCNormalGreyColor),),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

