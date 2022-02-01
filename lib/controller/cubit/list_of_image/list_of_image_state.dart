part of 'list_of_image_cubit.dart';

@immutable
abstract class ListOfImageState {}

class ListOfImageInitial extends ListOfImageState {}

class ListOfImageLoaded extends ListOfImageState {
  final List<ImageModel> listOfImage;
  ListOfImageLoaded( this.listOfImage);
}

class ListOfImageLoading extends ListOfImageState {
  final List<ImageModel> oldListOfImage;
  final bool isFirstFetch;
  ListOfImageLoading( this.oldListOfImage, { this.isFirstFetch = false});
}
