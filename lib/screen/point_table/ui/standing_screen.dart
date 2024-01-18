import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/screen/point_table/bloc/standing_bloc.dart';
import 'package:live_score/screen/point_table/bloc/standing_event.dart';
import 'package:live_score/screen/point_table/bloc/standings_state.dart';
import 'package:live_score/utils/network/response_status.dart';
import 'package:live_score/utils/theme/custom_themes.dart';
import 'package:live_score/utils/theme/text_theme.dart';
import 'package:live_score/utils/widgets/custom_data_table.dart';

import '../../../utils/img_assets/img_assets.dart';
import '../../../utils/widgets/custom_app_bar.dart';

class StandingScreen extends StatefulWidget {
  const StandingScreen({super.key});

  @override
  State<StandingScreen> createState() => _StandingScreenState();
}

class _StandingScreenState extends State<StandingScreen> {

  @override
  void initState() {
    context.read<StandingBloc>().add(const PointTableEvent(leagueId: 152));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Standings',
          centerTitle: true,
        ),
        body: Container(
          color: CustomColors.primary,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Table Standings',
                            style: theme.textTheme.boldFont.copyWith(
                                color: CustomColors.background, fontSize: 16)),
                        Text('See all',
                            style: theme.textTheme.mediumFont.copyWith(
                                color: CustomColors.background, fontSize: 12))
                      ],
                    ),
                    BlocBuilder<StandingBloc, StandingState>(
                      builder: (context, state) {
                        if (state.standingList == null || state.standingList?.state == ResponseState.loading) {
                          return const CircularProgressIndicator(color: CustomColors.background,);
                        }
                        return CustomDataTable(
                            backgroundColor: CustomColors.secondary,headerTextColor: CustomColors.background,cells: state.standingList!.data!.map((e) =>
                        [
                          DataTableRow(title: 'Club', value: '${e.teamName}',textAlign: TextAlign.start),
                          DataTableRow(title: 'W', value: '${e.gameWin}',textAlign: TextAlign.start),
                          DataTableRow(title: 'D', value: '${e.gameDraw}',textAlign: TextAlign.start),
                          DataTableRow(title: 'L', value: '${e.gameLoss}',textAlign: TextAlign.start),
                          DataTableRow(title: 'Point', value: '${e.gamePoint}',textAlign: TextAlign.start),
                        ]).toList(), columnTitle: [
                          ColumnTitle(title: 'Club', textColor: CustomColors.background,textAlign: TextAlign.left,width: 200),
                          ColumnTitle(title: 'W', textColor: Colors.white,textAlign: TextAlign.left),
                          ColumnTitle(title: 'D', textColor: Colors.white,textAlign: TextAlign.start),
                          ColumnTitle(title: 'L', textColor: Colors.white,textAlign: TextAlign.start),
                          ColumnTitle(title: 'Point', textColor: Colors.white,textAlign: TextAlign.start)
                        ]);
                      },)
                  ],
                ),),
              CustomSpacing.verticalSpace(space: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          ImageAssets.networkImgPlaceholder,
                          width: 30,
                          height: 30,
                        ),
                        CustomSpacing.horizontalSpace(space: 16),
                        Text('Player Name',
                            style: theme.textTheme.boldFont.copyWith(
                                color: CustomColors.background, fontSize: 16)),
                        Text('Goals',
                            style: theme.textTheme.mediumFont.copyWith(
                                color: CustomColors.background, fontSize: 12))
                      ],
                    );
                  },),)
            ],
          ),
        ),
      ),
    );
  }
}
