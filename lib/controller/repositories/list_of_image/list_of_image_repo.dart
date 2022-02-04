import 'package:task_app/controller/controller.dart';

class ListOfImageRepo {
  final ImageService imageService;

  ListOfImageRepo(this.imageService);

  Future<List<ImageModel>?> getImageList(int page, int limit) async {
    final getList = await imageService.fetchImages(page: page, limit: limit);
    return getList?.map((e) => ImageModel.fromJson(e)).toList();
  }
}
