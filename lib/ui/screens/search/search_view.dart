import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/custom_widgets/failed_text.dart';
import 'package:stay_updated/ui/custom_widgets/recommendation_card.dart';
import 'package:stay_updated/ui/custom_widgets/su_textfield.dart';
import 'package:stay_updated/ui/screens/search/search_view_model.dart';

import '../../../app/locator.dart';
import '../../../services/navigation_service.dart';
import '../../common/ui_helpers.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchViewModel>(builder: (context, model, child) {
      return PopScope(
        canPop: true,
        onPopInvoked: (value) {
          // model.updateIsVisible(false);
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: screenHeight(context),
                width: screenWidth(context),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          locator<NavigationService>().pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).iconTheme.color,
                          size: IconSize.menuButtonIcon,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Search',
                        style: kTBigText,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Information at the tips of your hand',
                        style: kTBodyText1.copyWith(color: kCNormalGreyColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SuTextField(
                        readOnly: false,
                        controller: model.searchController,
                        labelText: 'Xplore news',
                        onSubmitted: (v) {
                          log('Searching... ${model.searchController.text} by ${model.selectedFilterCategory}');
                          model.fetchSearchResult();
                        },
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: kCNormalGreyColor,
                        ),
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.sort_outlined,
                              color: kCNormalGreyColor),
                          tooltip: "Filter by category",
                          onSelected: (String selectedCategory) {
                            model
                                .updateSelectedFilterCategory(selectedCategory);
                            log('Selected from menu: $selectedCategory');
                            if (model.searchController.text.isNotEmpty) {
                              log('Searching--Category changed... ${model.searchController.text} by ${model.selectedFilterCategory}');
                              model.fetchSearchResult();
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return model.filterCategory.map((String category) {
                              bool isSelected =
                                  category == model.selectedFilterCategory;
                              return PopupMenuItem<String>(
                                value: category,
                                child: Text(
                                  category,
                                  style: kTSubtitleText.copyWith(
                                      fontSize: isSelected ? 14 : 12,
                                      fontStyle: isSelected
                                          ? FontStyle.italic
                                          : FontStyle.normal),
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: Visibility(
                          visible: model.isVisible,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Search Results (${model.searchResult.length}): \'${model.searchedWord}\' based on ${model.selectedFilterCategory}',
                                style: kTButtonText.copyWith(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: model.isSearchLoading == false
                                    ? model.searchErrorMessage == null
                                        ? Scrollbar(
                                            controller: model.scrollController,
                                            thickness: 6.0,
                                            radius: const Radius.circular(8.0),
                                            child: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemCount:
                                                    model.searchResult.length,
                                                itemBuilder: (context, index) {
                                                  final news =
                                                      model.searchResult[index];
                                                  return RecommendationCard(
                                                      news: news);
                                                }),
                                          )
                                        : FailedText(
                                            tag: model.searchedWord,
                                            onTap: () {
                                              model.fetchSearchResult();
                                            },
                                          )
                                    : const SizedBox(
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: kCBlueColor,
                                            strokeWidth: 4,
                                          ),
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
