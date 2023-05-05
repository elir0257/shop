part of 'item_cubit.dart';

enum ItemStatus { initial, loading, success, failure }

extension ItemStatusX on ItemStatus {
  bool get isInitial => this == ItemStatus.initial;
  bool get isLoading => this == ItemStatus.loading;
  bool get isSuccess => this == ItemStatus.success;
  bool get isFailure => this == ItemStatus.failure;
}

@JsonSerializable()
class ItemState extends Equatable{
  ItemState({
    this.status = ItemStatus.initial,
    ItemList? itemList,
}) : itemList = itemList ?? ItemList.empty;

  final ItemStatus status;
  final ItemList itemList;

  ItemState copyWith({
    ItemStatus? status,
    ItemList? itemList,
}) {
    return ItemState(
      status: status ?? this.status,
      itemList: itemList ?? this.itemList,
    );
  }

  Map<String, dynamic> toJson() => _$ItemStateToJson(this);

  @override
  List<Object> get props => [status, itemList];

}