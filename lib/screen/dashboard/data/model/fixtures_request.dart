import 'package:freezed_annotation/freezed_annotation.dart';
part 'fixtures_request.freezed.dart';
part 'fixtures_request.g.dart';

@freezed
class FixturesRequest with _$FixturesRequest {
  const factory FixturesRequest({
    @JsonKey(name: "league_id") int? league_id,
    @JsonKey(name: "from") String? fromDate,
    @JsonKey(name: "to") String? toDate
  }) = _FixturesRequest;

  factory FixturesRequest.fromJson(Map<String, dynamic> json) => _$FixturesRequestFromJson(json);
}
