part of 'image_info_cubit.dart';

@immutable
abstract class ImageInfoState {}

class ImageInfoInitial extends ImageInfoState {}

class ImageInfoLoading extends ImageInfoState {}

class ImageInfoLoaded extends ImageInfoState {
  final ImageModel imageModel;
  ImageInfoLoaded(this.imageModel);
}
class ImageInfoFailed extends ImageInfoState {
   final String message;
  ImageInfoFailed(this.message);
}
