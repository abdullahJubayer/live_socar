import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:live_score/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:live_score/screen/dashboard/bloc/dashboard_event.dart';
import 'package:live_score/screen/dashboard/bloc/dashboard_state.dart';
import 'package:live_score/utils/img_assets/img_assets.dart';
import 'package:live_score/utils/network/response_status.dart';
import 'package:live_score/utils/theme/custom_themes.dart';
import 'package:live_score/utils/theme/text_theme.dart';
import 'package:live_score/utils/widgets/custom_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:live_score/utils/widgets/custom_card.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../data/model/fixtures_request.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _currentIndex = 0;

  @override
  void initState() {
    context.read<DashboardBloc>().add(const FixtureEvent(request:FixturesRequest(fromDate: '2023-11-05',toDate: '2024-01-17',league_id: 152)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Livescore',
          centerTitle: true,
          actions: [Icon(FontAwesomeIcons.bell)],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (p0) => setState(() {
            _currentIndex = p0;
          }),
          backgroundColor: CustomColors.primary,
          items: [
            SalomonBottomBarItem(
                icon: Icon(FontAwesomeIcons.home),
                title: Text("Home"),
                selectedColor: CustomColors.background,
                unselectedColor: CustomColors.background),
            SalomonBottomBarItem(
                icon: Icon(Icons.table_rows),
                title: Text("Table"),
                selectedColor: CustomColors.background,
                unselectedColor: CustomColors.background),
            SalomonBottomBarItem(
                icon: Icon(Icons.bookmark),
                title: Text("Bookmark"),
                selectedColor: CustomColors.background,
                unselectedColor: CustomColors.background),
            SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                selectedColor: CustomColors.background,
                unselectedColor: CustomColors.background),
          ],
        ),
        body: Container(
          color: CustomColors.primary,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSpacing.verticalSpace(space: 20),
                CarouselSlider.builder(
                    itemCount: 10,
                    options: CarouselOptions(
                        height: 200,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        autoPlay: false,
                        enableInfiniteScroll: false),
                    itemBuilder: (context, index, realIndex) {
                      return CustomCard(
                          padding: EdgeInsets.zero,
                          gradient: const LinearGradient(
                              colors: [
                                CustomColors.roundIconBackground,
                                CustomColors.booked
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('60 : 01',
                                  style: theme.textTheme.mediumFont.copyWith(
                                      color: CustomColors.background,
                                      fontSize: 16)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageAssets.icLogo,
                                    width: 60,
                                    height: 60,
                                  ),
                                  CustomSpacing.horizontalSpace(space: 20),
                                  Text('02 ',
                                      style: theme.textTheme.mediumFont
                                          .copyWith(
                                              color: CustomColors.background,
                                              fontSize: 24)),
                                  Text('-',
                                      style: theme.textTheme.mediumFont
                                          .copyWith(
                                              color: CustomColors.background,
                                              fontSize: 24)),
                                  Text(' 02',
                                      style: theme.textTheme.mediumFont
                                          .copyWith(
                                              color: CustomColors.background,
                                              fontSize: 24)),
                                  Image.asset(
                                    ImageAssets.icLogo,
                                    width: 60,
                                    height: 60,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:3,
                                      itemBuilder: (context, index) {
                                        return Text('M.Salah',
                                            style: theme.textTheme.mediumFont
                                                .copyWith(
                                                color: CustomColors.background,
                                                fontSize: 12),textAlign: TextAlign.center,);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:3,
                                      itemBuilder: (context, index) {
                                        return Text('M.Salah',
                                            style: theme.textTheme.mediumFont
                                                .copyWith(
                                                color: CustomColors.background,
                                                fontSize: 12),textAlign: TextAlign.center,);
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          ));
                    }),
                CustomSpacing.verticalSpace(space: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Match Schedule',
                        style: theme.textTheme.boldFont.copyWith(
                            color: CustomColors.background, fontSize: 16)),
                    Text('See all',
                        style: theme.textTheme.mediumFont.copyWith(
                            color: CustomColors.background, fontSize: 12))
                  ],
                ),
                CustomSpacing.verticalSpace(space: 16),
                SizedBox(
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    builder: (BuildContext context, DashboardState state) {
                      if(state.fixtureList?.state == ResponseState.loading){
                        return const CircularProgressIndicator();
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.fixtureList?.data?.length ?? 10,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => CustomCard(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            backgroundColor: CustomColors.secondary,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  state.fixtureList?.data?[index].teamHomeBadge ?? ImageAssets.networkImgPlaceholder,
                                  width: 30,
                                  height: 30,
                                ),
                                CustomSpacing.horizontalSpace(space: 20),
                                Text(state.fixtureList?.data?[index].formatDate ?? '',
                                    style: theme.textTheme.mediumFont.copyWith(
                                        color: CustomColors.background,
                                        fontSize: 18)),
                                Text(' | ${11}:00 PM',
                                    style: theme.textTheme.mediumFont.copyWith(
                                        color: CustomColors.background,
                                        fontSize: 18)),
                                CustomSpacing.horizontalSpace(space: 20),
                                Image.network(
                                  state.fixtureList?.data?[index].teamAwayBadge ?? ImageAssets.networkImgPlaceholder,
                                  width: 30,
                                  height: 30,
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
