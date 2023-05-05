import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';


@JsonSerializable()
class ListItemsModel extends Equatable{
  const ListItemsModel({
    required this.items,
  });

  final List<Item> items;

  factory ListItemsModel.fromJson(Map<String, dynamic> json) => _$ListItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListItemsModelToJson(this);

  @override
  List<Object> get props => [items];
}


@JsonSerializable()
class Item{
  const Item({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.price,
    required this.colors
  });

  final int id;
  final String title;
  final String slug;
  final ImageModel? image;
  final double price;
  final List<ColorsModel> colors;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

}

@JsonSerializable()
class ImageModel{
  const ImageModel({
    required this.file,
  });

  final FileModel file;

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

}

@JsonSerializable()
class FileModel extends Equatable{
  const FileModel({
    required this.url,
    required this.name,
    required this.originalName,
    required this.extension,
  });

  final String url;
  final String name;
  final String originalName;
  final String extension;

  factory FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileModelToJson(this);

  @override
  List<Object> get props => [url, name, originalName, extension];
}

@JsonSerializable()
class ColorsModel extends Equatable{
  const ColorsModel({
    required this.id,
    required this.title,
    required this.code,
  });

  final int id;
  final String title;
  final String code;

  factory ColorsModel.fromJson(Map<String, dynamic> json) => _$ColorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsModelToJson(this);

  @override
  List<Object> get props => [id, title, code];
}

