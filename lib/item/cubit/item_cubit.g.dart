// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemState _$ItemStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ItemState',
      json,
      ($checkedConvert) {
        final val = ItemState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$ItemStatusEnumMap, v) ??
                  ItemStatus.initial),
          itemList: $checkedConvert(
              'item_list',
              (v) => v == null
                  ? null
                  : ItemList.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'itemList': 'item_list'},
    );

Map<String, dynamic> _$ItemStateToJson(ItemState instance) => <String, dynamic>{
      'status': _$ItemStatusEnumMap[instance.status]!,
      'item_list': instance.itemList,
    };

const _$ItemStatusEnumMap = {
  ItemStatus.initial: 'initial',
  ItemStatus.loading: 'loading',
  ItemStatus.success: 'success',
  ItemStatus.failure: 'failure',
};
