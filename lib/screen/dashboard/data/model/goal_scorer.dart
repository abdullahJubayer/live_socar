import 'package:freezed_annotation/freezed_annotation.dart';
part 'goal_scorer.freezed.dart';
part 'goal_scorer.g.dart';

@freezed
class Goalscorer with _$Goalscorer {
  const factory Goalscorer({
    @JsonKey(name: "time") String? time,
    @JsonKey(name: "homeScorer") String? homeScorer,
    @JsonKey(name: "homeAssist") String? homeAssist,
    @JsonKey(name: "score") String? score,
    @JsonKey(name: "awayScorer") String? awayScorer,
    @JsonKey(name: "awayAssist") String? awayAssist,
    @JsonKey(name: "scoreInfoTime") String? scoreInfoTime
  }) = _Goalscorer;

  factory Goalscorer.fromJson(Map<String, Object?> json)=> _$GoalscorerFromJson(json);
}