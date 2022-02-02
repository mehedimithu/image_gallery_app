import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:task_app/controller/controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/constants/colors.dart';
import 'package:task_app/presentation/presentation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ImageInfoScreen extends StatefulWidget {
  const ImageInfoScreen({Key? key, required this.id, required this.downloadUrl})
      : super(key: key);
  final String id;
  final String downloadUrl;

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: floatButton(widget.downloadUrl),
      body: imageView(size),
    );
  }

  FloatingActionButton floatButton(String downloadUrl) {
    return FloatingActionButton(
        elevation: 0.0,
        child:  Icon(
          Icons.share,
          size: 25.sp,
          color: TaskAppColors.kYellowColorAccent,
        ),
        backgroundColor: Colors.transparent,
        onPressed: () async {
          final imageUrl = downloadUrl;
          final uri = Uri.parse(imageUrl);
          final response = await http.get(uri);
          final bytes = response.bodyBytes;
          final temp = await getTemporaryDirectory();
          final path = '${temp.path}/image.jpg';
          File(path).writeAsBytesSync(bytes);
          await Share.shareFiles([path], text: 'Image Shared');
        });
  }

  Widget imageView(size) {
    return BlocBuilder<ImageInfoCubit, ImageInfoState>(
      builder: (context, state) {
        if (state is ImageInfoLoading) {
          return _loadingIndicator();
        } else if (state is ImageInfoLoaded) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PhotoView.customChild(
              child: ImageLoader(
                imageUrl: state.imageModel.downloadUrl.toString(),
              ),
              childSize:  Size(500.0.h, 500.0.w),
              backgroundDecoration:
                  const BoxDecoration(color: TaskAppColors.kBlack300Color),
              customSize: size,
              enableRotation: true,
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 1.8,
              initialScale: PhotoViewComputedScale.covered,
            ),
          );
        }
        return _loadingIndicator();
      },
    );
  }

  Widget _loadingIndicator() {
    return  Padding(
      padding: EdgeInsets.all(8.0.r),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
