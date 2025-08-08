import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/ui/common/styles.dart';
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
    return Consumer<SearchViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              height: screenHeight(context),
              width: screenWidth(context),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          locator<NavigationService>().pop();
                        },
                        child: Icon(Icons.arrow_back,color: Theme.of(context).iconTheme.color,size: IconSize.menuButtonIcon,),),
                      const SizedBox(height: 10,),
                      const Text('Search', style: kTBigText,),
                      const SizedBox(height: 4,),
                      Text('Information at the tips of your hand', style: kTBodyText1.copyWith(color: kCNormalGreyColor),),
                      const SizedBox(height: 20,),
                      SuTextField(
                          readOnly: false,
                        controller: model.searchController,
                        labelText: 'Xplore news',
                        prefixIcon: const Icon(Icons.search_rounded,color: kCNormalGreyColor,),
                        suffixIcon:  PopupMenuButton<String>(
                          icon: const Icon(Icons.sort_outlined, color: kCNormalGreyColor),
                          tooltip: "Filter by category",
                          onSelected: (String selectedCategory) {
                            model.updateSelectedFilterCategory(selectedCategory);
                            log('Selected from menu: $selectedCategory');
                          },
                          itemBuilder: (BuildContext context) {
                            return model.filterCategory.map((String category) {
                              bool isSelected = category == model.selectedFilterCategory;
                              return PopupMenuItem<String>(
                                value: category,
                                child: Text(category, style: kTSubtitleText.copyWith(fontSize: isSelected ? 14 : 12,
                                    fontStyle: isSelected ? FontStyle.italic : FontStyle.normal),),
                              );
                            }).toList();
                          },
                        ),
                      ),
                      const SizedBox(height: 30,),
                     // if (1==1) const Center(child: Text('No search yet', style: kTSubtitleText,),) else const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
