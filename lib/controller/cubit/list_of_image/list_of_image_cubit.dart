import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_app/controller/controller.dart';

part 'list_of_image_state.dart';

class ListOfImageCubit extends Cubit<ListOfImageState> {
  ListOfImageCubit(this.repository) : super(ListOfImageInitial());

  int page = 1;
  final ListOfImageRepo repository;

  void loadImages( ) {
    if (state is ListOfImageLoading) return;
    final currentState = state;

    var oldListOfImage = <ImageModel>[];

    if (currentState is ListOfImageLoaded) {
      oldListOfImage = currentState.listOfImage;
    }
    emit(ListOfImageLoading(oldListOfImage, isFirstFetch: page == 1));

    repository.getImageList(page).then((newImages) {
      page++;
      final load = (state as ListOfImageLoading).oldListOfImage;
      load.addAll(newImages!);

      emit(ListOfImageLoaded(load));
    });
  }
}
