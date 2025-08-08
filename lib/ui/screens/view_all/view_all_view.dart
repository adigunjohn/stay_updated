import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/custom_widgets/recommendation_card.dart';
import 'view_all_view_model.dart';

class ViewAllView extends StatelessWidget {
  const ViewAllView({super.key, this.viewAll});
 static const String id = 'ViewAllView';
  final ViewAll? viewAll;
  @override
  Widget build(BuildContext context) {
    return Consumer<ViewAllViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                height: screenHeight(context),
                width: screenWidth(context),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          locator<NavigationService>().pop();
                        },
                          child: Icon(Icons.arrow_back,color: Theme.of(context).iconTheme.color,size: IconSize.menuButtonIcon,),),
                      const SizedBox(height: 10,),
                      Text(viewAll == ViewAll.breakingNews ? 'Breaking News' : 'Recommendation', style: kTBigText,),
                      // const SizedBox(height: 10,),
                      const SizedBox(height: 22,),
                      Expanded(
                        child: SizedBox(
                          child: ListView(
                              children: List.generate(12,(index) => const RecommendationCard()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
