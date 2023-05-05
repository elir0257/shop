import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:repository/repository.dart';
import 'package:repository/repository.dart' as item_repository;


part 'item.g.dart';

@JsonSerializable()
class ItemList{
  const ItemList({
    required this.items,
  });

  final List<Item>? items;

  factory ItemList.fromRepository(item_repository.ListItemsModel? list){
    return ItemList(
      items: list?.items
    );
  }

  ItemList copyWith({
    List<Item>? items,
  }) {
    return ItemList(
      items: items ?? this.items,
    );
  }

  static final empty = ItemList(
    items: List.empty(),
  );

  factory ItemList.fromJson(Map<String, dynamic> json) => _$ItemListFromJson(json);

  Map<String, dynamic> toJson() => _$ItemListToJson(this);

}