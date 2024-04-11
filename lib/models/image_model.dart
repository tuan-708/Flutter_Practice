import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  @JsonSerializable(explicitToJson: true)
  factory ImageModel({
    required String imageName,
    required String directoryName,
    required String downloadUrl,
  })  = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

}