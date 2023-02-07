import 'package:demo_gallery/all_file/all_file.dart';

part 'gallery_base_model.g.dart';

@JsonSerializable()
class PhotoListResp {
  final int? page;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final List<PhotoModel>? photos;
  @JsonKey(name: 'total_results')
  final int? totalResults;
  @JsonKey(name: 'next_page')
  final String? nextPage;
  @JsonKey(name: 'prev_page')
  final String? prevPage;

  PhotoListResp({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  });

  factory PhotoListResp.fromJson(Map<String, dynamic> json) =>
      _$PhotoListRespFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoListRespToJson(this);
}

@JsonSerializable()
class PhotoModel {
  final int? id;
  final int? width;
  final int? height;
  final String? url;
  final String? photographer;
  @JsonKey(name: 'photographer_url')
  final String? photographerUrl;
  @JsonKey(name: 'photographer_id')
  final int? photographerId;
  @JsonKey(name: 'avg_color')
  final String? avgColor;
  final PhotoSrcModel? src;
  final String? alt;

  PhotoModel({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.alt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}

@JsonSerializable()
class PhotoSrcModel {
  final String? original;
  final String? large2x;
  final String? large;
  final String? medium;
  final String? small;
  final String? portrait;
  final String? landscape;
  final String? tiny;

  PhotoSrcModel({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  factory PhotoSrcModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoSrcModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoSrcModelToJson(this);
}
