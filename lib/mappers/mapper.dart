import 'package:repository/repository.dart';
import 'package:api/api.dart';

abstract class Mapper<Src, Dst> {
  Dst? map(Src? model);

  List<Dst> mapList(List<Src>? models) =>
      models?.map(map).toList().whereType<Dst>().toList() ?? List<Dst>.empty();
}

class FileMapper extends Mapper<ApiFileModel, FileModel> {
  @override
  FileModel map(ApiFileModel? model) {
    return FileModel(
      url: model?.url ?? '',
      name: model?.name ?? '',
      originalName: model?.originalName ?? '',
      extension: model?.extension ?? '',
    );
  }
}

class ColorsMapper extends Mapper<ApiColorsModel, ColorsModel> {
  @override
  ColorsModel? map(ApiColorsModel? model) {
    return ColorsModel(
        id: model?.id ?? 0, title: model?.title ?? '', code: model?.code ?? '');
  }
}

class ImageMapper extends Mapper<ApiImageModel, ImageModel> {
  ImageMapper({required this.fileMapper});

  final FileMapper fileMapper;

  @override
  ImageModel? map(ApiImageModel? model) {

    return ImageModel(
        file: fileMapper.map(model?.file)
    );
  }
}

class ItemMapper extends Mapper<ApiItem, Item>{
  ItemMapper({required this.colorsMapper, required this.imageMapper});

  final ImageMapper imageMapper;
  final ColorsMapper colorsMapper;

  @override
  Item? map(ApiItem? model){
    return Item(
      id: model?.id ?? 0,
      colors: colorsMapper.mapList(model?.colors),
      image: imageMapper.map(model?.image),
      price: model?.price ?? 0,
      slug: model?.slug ?? '',
      title: model?.title ?? '',
    );
  }
}

class ListItemsMapper extends Mapper<ApiListItemsModel, ListItemsModel>{
  ListItemsMapper({required this.itemMapper});

  final ItemMapper itemMapper;

  @override
  ListItemsModel? map(ApiListItemsModel? model){
    final List<ApiItem>? items = model?.items;
    return ListItemsModel(
        items: items != null ? itemMapper.mapList(model?.items) : []);
  }
}
