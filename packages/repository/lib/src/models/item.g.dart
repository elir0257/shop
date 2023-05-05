// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListItemsModel _$ListItemsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListItemsModel',
      json,
      ($checkedConvert) {
        final val = ListItemsModel(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => Item.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ListItemsModelToJson(ListItemsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Item',
      json,
      ($checkedConvert) {
        final val = Item(
          id: $checkedConvert('id', (v) => v as int),
          title: $checkedConvert('title', (v) => v as String),
          slug: $checkedConvert('slug', (v) => v as String),
          image: $checkedConvert(
              'image',
              (v) => v == null
                  ? null
                  : ImageModel.fromJson(v as Map<String, dynamic>)),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
          colors: $checkedConvert(
              'colors',
              (v) => (v as List<dynamic>)
                  .map((e) => ColorsModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'image': instance.image,
      'price': instance.price,
      'colors': instance.colors,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ImageModel',
      json,
      ($checkedConvert) {
        final val = ImageModel(
          file: $checkedConvert(
              'file', (v) => FileModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

FileModel _$FileModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'FileModel',
      json,
      ($checkedConvert) {
        final val = FileModel(
          url: $checkedConvert('url', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          originalName: $checkedConvert('original_name', (v) => v as String),
          extension: $checkedConvert('extension', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'originalName': 'original_name'},
    );

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'original_name': instance.originalName,
      'extension': instance.extension,
    };

ColorsModel _$ColorsModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ColorsModel',
      json,
      ($checkedConvert) {
        final val = ColorsModel(
          id: $checkedConvert('id', (v) => v as int),
          title: $checkedConvert('title', (v) => v as String),
          code: $checkedConvert('code', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ColorsModelToJson(ColorsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'code': instance.code,
    };
