import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop/mappers/mapper.dart';

import 'package:repository/repository.dart';

Future<Widget> injection(Widget app) async {

  final fileMapper = FileMapper();
  final imageMapper = ImageMapper(fileMapper: fileMapper);
  final colorsMapper = ColorsMapper();
  final itemMapper =
      ItemMapper(colorsMapper: colorsMapper, imageMapper: imageMapper);
  final listItemsMapper = ListItemsMapper(itemMapper: itemMapper);
  final itemRepository = ItemRepository(listItemsMapper: listItemsMapper);

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());

  return MultiRepositoryProvider(providers: [
    RepositoryProvider<ItemRepository>(create: (_) => itemRepository)
  ], child: app);
}
