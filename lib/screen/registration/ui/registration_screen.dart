import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:live_score/utils/img_assets/img_assets.dart';
import 'package:live_score/utils/theme/custom_themes.dart';
import 'package:live_score/utils/theme/text_theme.dart';
import 'package:live_score/utils/widgets/custom_button.dart';
import 'package:live_score/utils/widgets/custom_text_form_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _fromKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: CustomColors.appBackground,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Align(alignment : Alignment.center,child: Image.asset(ImageAssets.regBack,width: 200,height: 200,)),
              CustomSpacing.verticalSpace(space: 30),
              Text('Getting Started',style: theme.textTheme.boldFont.copyWith(fontSize: 24),),
              CustomSpacing.verticalSpace(space: 6),
              Text('Let\'s login for explore continues',style: theme.textTheme.mediumFont.copyWith(color: CustomColors.outline,fontSize: 16),),
              CustomSpacing.verticalSpace(space: 50),
              Text('Email or Phone Number',style: theme.textTheme.boldFont,),
              CustomSpacing.verticalSpace(space: 4),
              CustomTextFormField(showCursor: false, icon: FontAwesomeIcons.message,controller: emailTextController,type : CustomTextFormFieldType.rounded,borderRadius: 8,),
              CustomSpacing.verticalSpace(space: 20),
              Text('Password',style: theme.textTheme.boldFont,),
              CustomSpacing.verticalSpace(space: 4),
              CustomTextFormField(showCursor: false, icon: FontAwesomeIcons.message,controller: passwordTextController,type: CustomTextFormFieldType.rounded,borderRadius: 8,),
              CustomSpacing.verticalSpace(space: 12),
              Text('Forgot Password?',style: theme.textTheme.mediumFont.copyWith(color: CustomColors.button,fontSize: 12),),
              CustomSpacing.verticalSpace(space: 16),
              CustomButton(text: 'Sign up',color: CustomColors.primary,borderRadius: 16,onPressed: () {},),
              CustomSpacing.verticalSpace(space: 20),
              Row(children: [
                Text('Don\'t hava an account?',style: theme.textTheme.mediumFont.copyWith(color: CustomColors.primary,fontSize: 10),),
                Text('Signup hare',style: theme.textTheme.mediumFont.copyWith(color: CustomColors.button,fontSize: 10),),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
