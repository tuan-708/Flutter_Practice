import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand.freezed.dart';
part 'brand.g.dart';

const String collectionBrand = 'Brands';
const String brandFieldId = 'id';
const String brandFieldName = 'name';

@unfreezed
class Brand with _$Brand{

  factory Brand({
    String? id,
    required String name
  }) = _Brand;
  

  factory Brand.fromJson(Map<String, dynamic> map) =>
    _$BrandFromJson(map);
  
}