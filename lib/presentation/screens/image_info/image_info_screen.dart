import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:task_app/controller/controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageInfoScreen extends StatefulWidget {
  const ImageInfoScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _ImageInfoScreenState createState() => _ImageInfoScreenState();
}

class _ImageInfoScreenState extends State<ImageInfoScreen> {
  ImageInfoCubit? _imageInfoCubit;

  @override
  void initState() {
    _imageInfoCubit = context.read<ImageInfoCubit>();
    _imageInfoCubit?.getInfoDat(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: imageView(),
    );
  }

  Widget imageView() {
    return BlocBuilder<ImageInfoCubit, ImageInfoState>(
      builder: (context, state) {
        if (state is ImageInfoLoading) {
          return _loadingIndicator();
        } else if (state is ImageInfoLoaded) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PhotoView(
              imageProvider: AssetImage("${state.imageModel.downloadUrl}"),
            ),
          );
        }
        return _loadingIndicator();
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
