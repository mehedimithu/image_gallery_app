import 'package:task_app/controller/controller.dart';

class InfoAboutImagesRepo {
  final InfoImageService infoImageService;

  InfoAboutImagesRepo(this.infoImageService);

  Future getImageInfo(String id) async {
    final getImageInfo = await infoImageService.fetchInfo(id: id);
    return getImageInfo;
  }
}
