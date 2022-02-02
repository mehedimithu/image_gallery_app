import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_app/controller/controller.dart';

part 'image_info_state.dart';

class ImageInfoCubit extends Cubit<ImageInfoState> {
  ImageInfoCubit(this.service) : super(ImageInfoInitial());

  final InfoImageService service;

  Future<void> getInfoDat({required String id}) async {
    emit(ImageInfoLoading());
    final response = await service.fetchInfo(id: id);
    try {
      ImageModel imageModel =
          ImageModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      emit(ImageInfoLoaded(imageModel));
    } catch (e) {
      emit(ImageInfoFailed('Error!'));
    }
  }
}
