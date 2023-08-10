// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_page_adders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


GoogsPageAdders _$GoogsPageAddersFromJson(Map<String, dynamic> json) => GoogsPageAdders(
  list: (json['list'] as List<dynamic>?)?.map((e) => AddersIfo.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$GoogsPageAddersJson(GoogsPageAdders instance) => <String, dynamic>{
  'list': instance.list,
};

AddersIfo _$AddersIfoFromJson(Map<String, dynamic> json) => AddersIfo(
  name: json['name'] as String?,
  address: json['address'] as String?,
  detailed: json['detailed'] as String?,
  phone: json['phone'] as String?,
  mobile: json['mobile'] as String?,
);

Map<String, dynamic> _$AddersIfoJson(AddersIfo instance) => <String, dynamic>{
  'name': instance.name,
  'address': instance.address,
  'detailed': instance.detailed,
  'phone': instance.phone,
  'mobile': instance.mobile,
};
