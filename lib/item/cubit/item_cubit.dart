import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:repository/repository.dart' hide Item show ItemRepository;
import 'package:shop/item/item.dart';

part 'item_state.dart';
part 'item_cubit.g.dart';

class ItemCubit extends HydratedCubit<ItemState>{
  ItemCubit(this._itemRepository) : super(ItemState()){
    fetchItem();
  }

  final ItemRepository _itemRepository;

  Future<void> fetchItem() async{

    emit(state.copyWith(status: ItemStatus.loading));

    try{
      final itemList = ItemList.fromRepository(
        await _itemRepository.getListItems(),
      );

      emit(
        state.copyWith(
          status: ItemStatus.success,
          itemList: itemList
        ),
      );
    } on Exception{
      emit(state.copyWith(status: ItemStatus.failure));
    }
  }


  @override
  ItemState fromJson(Map<String,dynamic> json) => _$ItemStateFromJson(json);

  @override
  Map<String, dynamic> toJson(ItemState state) => state.toJson();
}