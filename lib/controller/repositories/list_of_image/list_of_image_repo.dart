import 'package:task_app/controller/controller.dart';

class ListOfImageRepo {
  final ImageService imageService;

  ListOfImageRepo(this.imageService);

  Future<List<ImageModel>?> getImageList(int page) async {
    final getList = await imageService.fetchImages(page: page);
    return getList?.map((e) => ImageModel.fromJson(e)).toList();
  }
}
