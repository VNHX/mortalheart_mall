import 'package:json_annotation/json_annotation.dart';
part 'goods_page_adders.g.dart';

@JsonSerializable()
class GoogsPageAdders {
  final List<AddersIfo>? list;

  const GoogsPageAdders({
    this.list,
  });

  factory GoogsPageAdders.fromJson(Map<String, dynamic> json) => _$GoogsPageAddersFromJson(json);

  Map<String, dynamic> toJson() => _$GoogsPageAddersJson(this);
}

@JsonSerializable()
class AddersIfo {
  final String? name;
  final String? address;
  final String? detailed;
  final String? phone;
  final String? mobile;
  AddersIfo({
    this.name,
    this.address,
    this.detailed,
    this.phone,
    this.mobile,
  });

  factory AddersIfo.fromJson(Map<String, dynamic> json) => _$AddersIfoFromJson(json);

  Map<String, dynamic> toJson() => _$AddersIfoJson(this);
}
