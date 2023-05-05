import 'dart:async';

import 'package:api/api.dart';
import 'package:repository/repository.dart';
import 'package:shop/mappers/mapper.dart';

class ItemRepository{
  //ItemRepository({ ApiClient? apiClient})
    //: _apiClient = apiClient ?? ApiClient();

  //ItemRepository({ApiClient? apiClient, this._listItemsMapper})
    //:_apiClient = apiClient ?? ApiClient();


  ItemRepository({ required this.listItemsMapper, ApiClient? apiClient})
    : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;
  final ListItemsMapper listItemsMapper;

  Future<ListItemsModel?> getListItems() async{

    final listItems = await _apiClient.getListItems();

    return listItemsMapper.map(listItems);
  }
}