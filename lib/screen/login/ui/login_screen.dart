import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:live_score/screen/login/bloc/login_bloc.dart';
import 'package:live_score/screen/login/bloc/login_event.dart';
import 'package:live_score/screen/login/data/model/login_request.dart';
import 'package:live_score/utils/img_assets/img_assets.dart';
import 'package:live_score/utils/network/response_status.dart';
import 'package:live_score/utils/theme/custom_themes.dart';
import 'package:live_score/utils/theme/text_theme.dart';
import 'package:live_score/utils/widgets/custom_button.dart';
import 'package:live_score/utils/widgets/custom_text_form_field.dart';

import '../bloc/signin_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isEmailPassValid=false;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final bloc = context.read<LoginBloc>();

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: CustomColors.appBackground,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: SingleChildScrollView(
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
                BlocBuilder<LoginBloc,SignInState>(
                  buildWhen: (previous, current) {
                    return previous.isEmailValid != current.isEmailValid;
                  },
                  builder: (context, state) {
                  return CustomTextFormField(showCursor: false, icon: FontAwesomeIcons.envelope,controller: emailTextController,type : CustomTextFormFieldType.rounded,borderRadius: 8,suffix : Icon(state.isEmailValid ? FontAwesomeIcons.check: FontAwesomeIcons.exclamation),onChanged: (p0) => bloc.add(EmailChanged(p0)));
                },),
                CustomSpacing.verticalSpace(space: 20),
                Text('Password',style: theme.textTheme.boldFont,),
                CustomSpacing.verticalSpace(space: 4),
                BlocBuilder<LoginBloc,SignInState>(
                  buildWhen: (previous, current) {
                    return previous.isPassValid != current.isPassValid;
                  },
                  builder: (context, state) {
                  return CustomTextFormField(showCursor: false, icon: FontAwesomeIcons.lock,controller: passwordTextController,type: CustomTextFormFieldType.rounded,borderRadius: 8,suffix : Icon(state.isPassValid ? FontAwesomeIcons.check: FontAwesomeIcons.exclamation),onChanged: (p0) => bloc.add(PasswordChanged(p0)),);
                },),
                CustomSpacing.verticalSpace(space: 12),
                Align(alignment: Alignment.centerRight,child: Text('Forgot Password?',style: theme.textTheme.mediumFont.copyWith(color: CustomColors.button,fontSize: 12),)),
                CustomSpacing.verticalSpace(space: 16),
                MultiBlocListener(listeners: [
                  BlocListener<LoginBloc, SignInState>(
                    listener: (context, state) => setState(() {_isEmailPassValid=state.isEmailValid;}),
                  ),
                  BlocListener<LoginBloc, SignInState>(
                    listener: (context, state) => setState(() {_isEmailPassValid=state.isPassValid;}),
                  )
                ], child: BlocBuilder<LoginBloc,SignInState>(builder: (context, state) => CustomButton(showProgressIndicator: state.loginUser?.state == ResponseState.loading,text: 'Sign up',color: CustomColors.primary,borderRadius: 16,onPressed: _isEmailPassValid ? _doSignup : null,))),
                CustomSpacing.verticalSpace(space: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Don\'t hava an account?',style: theme.textTheme.mediumFont.copyWith(color: CustomColors.topBackgroundDark,fontSize: 12),),
                  CustomSpacing.horizontalSpace(space: 4),
                  Text('Signup hare',style: theme.textTheme.mediumFont.copyWith(color: CustomColors.button,fontSize: 13),),
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _doSignup(){
    context.read<LoginBloc>().add(Login(request: LoginRequest(email: emailTextController.text,pass: passwordTextController.text)));
  }
}
