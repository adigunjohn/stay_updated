import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/custom_widgets/recommendation_card.dart';
import 'package:stay_updated/ui/screens/bookmark/bookmark_view_model.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({super.key});
  static const String id = 'BookmarkView';
  @override
  Widget build(BuildContext context) {
    return Consumer<BookmarkViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: screenHeight(context),
            width: screenWidth(context),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bookmarks',
                    style: kTBigText,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'You\'ve ${model.bookMarkedNews.length} bookmarked news...',
                    style: kTBodyText1.copyWith(
                        color: kCNormalGreyColor, fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: model.bookMarkedNews.isNotEmpty
                        ? Scrollbar(
                      controller: model.scrollController,
                      thickness: 6.0,
                      radius: const Radius.circular(8.0),
                          child: ListView.builder(
                              itemCount: model.bookMarkedNews.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (_, index) {
                                final news = model.bookMarkedNews[index];
                                return Stack(
                                  children: [
                                    RecommendationCard(
                                      news: news,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(onPressed: (){
                                        model.deleteNews(news);
                                      }, icon: const Icon(Icons.clear_outlined, color: kCBlueColor, size: 20,),),
                                    )
                                  ],
                                );
                              }),
                        )
                        : const Center(
                            child: Text('Your bookmarks will appear here.', style: kTSubtitleText,),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
