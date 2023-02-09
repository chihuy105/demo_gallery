import 'package:demo_gallery/all_file/all_file.dart';

part 'user_api_data.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class UserModel {
  final String? userId;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  const UserModel({
    this.userId,
  });
}
