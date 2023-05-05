import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:api/api.dart';
import 'package:shop/item/item.dart';


class GetItemsRequestFailure implements Exception {}

class ApiClient{
  ApiClient({http.Client? httpClient, })
    : _httpClient = httpClient ?? http.Client();


  final http.Client _httpClient;

  static const _baseUrl = 'vue-study.skillbox.cc';

  Future<ApiListItemsModel> getListItems() async{
   try {
      final listItemsRequest = Uri.https(
        _baseUrl,
        '/api/products',{
          'current_listItems': 'true'
      }
      );

      final listItemResponse = await _httpClient.get(listItemsRequest);

      //developer.log('${listItemResponse.body}');
      //developer.log('${jsonDecode(listItemResponse.body) as Map}');

      if (listItemResponse.statusCode != 200) {throw GetItemsRequestFailure();}

      //final listItemsJson = json.decode(listItemResponse.body);
      final listItemsJson = json.decode(listItemResponse.body) ;


      //final result = listItemsJson;

      print('${ApiListItemsModel.fromJson(listItemsJson)}');

      print('эщкере');
      //developer.log('${ApiListItemsModel.fromJson(result.first as Map<String, dynamic>)}');

     return ApiListItemsModel.fromJson(listItemsJson) ;
    }
    catch(e){
     print(e);
     const List<ApiColorsModel> list = [ApiColorsModel(id: 0, title: '', code: '')];
     return const ApiListItemsModel(items: [ApiItem(id: 0, title: '', slug: '', image: ApiImageModel(file: ApiFileModel(url: '', name: '', originalName: '', extension: '')), price: 0, colors: list )]);
    }
  }
}

