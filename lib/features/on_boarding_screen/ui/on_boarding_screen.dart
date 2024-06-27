import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_disease_app/core/theming/styles.dart';
import 'package:plant_disease_app/features/on_boarding_screen/ui/widgets/get_started_button.dart';
import 'package:plant_disease_app/features/on_boarding_screen/ui/widgets/plant_imge_and_text.dart';
import 'package:plant_disease_app/features/on_boarding_screen/ui/widgets/plant_logo_and_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(
              top: 30.h,
              bottom: 30.h
            ),
            child:  Column(
              children: [
                const PlantLogoAndName(),
                SizedBox(height: 30.h,),
                const PlantImageAndText(),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 30.w),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Keep your plant in good health' ,
                      style: TextStyles.font13GrayRegular,
                      textAlign: TextAlign.center,),
                      SizedBox(height: 30.h,),
                      const GetStartedButton(),
                    ],
                   ),
                 )
              ],
            ),
          ),
        )
      ),
    );
  }
}
