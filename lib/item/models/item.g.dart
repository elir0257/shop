// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemList _$ItemListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ItemList',
      json,
      ($checkedConvert) {
        final val = ItemList(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ItemListToJson(ItemList instance) => <String, dynamic>{
      'items': instance.items,
    };
