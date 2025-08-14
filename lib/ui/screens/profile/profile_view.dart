
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/strings.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/custom_widgets/su_textfield.dart';
import 'package:stay_updated/ui/screens/profile/profile_view_model.dart';
import '../../common/styles.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const String id = 'ProfileView';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, model, child) {
        return PopScope(
          canPop: true,
          onPopInvoked: (value){
            // if(model.emailReadOnly == false){model.emailController.clear();}
            // if(model.nameReadOnly == false){ model.nameController.clear();}
            // model.updateEmailReadOnly(true);
            // model.updateNameReadOnly(true);
          },
          child: Scaffold(
            body: SafeArea(
              child: SizedBox(
                height: screenHeight(context),
                child: SingleChildScrollView(
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
                        const Text('Profile', style: kTBigText,),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 75,
                                          child: CircleAvatar(
                                            radius: 60,
                                            backgroundColor: Colors.blue.shade100,
                                            child:
                                            const Icon(Icons.person_rounded, size: 85,color: Colors.grey,),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 4,
                                          left: 0,
                                          right: 0,
                                          // top: 0,
                                          child: GestureDetector(
                                            onTap: (){},
                                            child: const CircleAvatar(
                                              radius: 13,
                                              backgroundColor: Colors.blue,
                                              child: Icon(Icons.camera_alt_outlined, size: 17,color: Colors.white,),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  //model.nameController.text.isEmpty ? AppStrings.randomName : model.fullName,
                                  model.fullName,
                                  style: kTSubtitleText.copyWith(fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Full Name',
                                  style: kTSubtitleText,
                                ),
                                GestureDetector(
                                  onTap: (){
                                     if(model.nameReadOnly == false){ model.updateName();}
                                    model.updateNameReadOnly(!model.nameReadOnly);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: model.nameReadOnly == true ? const Icon(Icons.edit, color: Colors.blue,) : const Icon(Icons.save_outlined, color: Colors.blue,),
                                  ),),
                              ],
                            ),
                            SuTextField(
                              hintText: AppStrings.randomName,
                              keyboardType: TextInputType.name,
                              readOnly: model.nameReadOnly,
                              controller: model.nameController,
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Email Address',
                                  style: kTSubtitleText,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    if(model.emailReadOnly == false){
                                      model.updateEmail();
                                    }
                                    model.updateEmailReadOnly(!model.emailReadOnly);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: model.emailReadOnly == true ? const Icon(Icons.edit, color: Colors.blue,) : const Icon(Icons.save_outlined, color: Colors.blue,),
                                  ),),
                              ],
                            ),
                            SuTextField(
                              hintText: 'johndoe2023@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              readOnly: model.emailReadOnly,
                              controller: model.emailController,
                            ),
                          ],
                        ),
                      ],
                    ),
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


