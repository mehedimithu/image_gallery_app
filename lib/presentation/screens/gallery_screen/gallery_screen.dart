import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_app/controller/controller.dart';
import 'package:task_app/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  ListOfImageCubit? _listOfImageCubit;

  final scrollController = ScrollController();

  @override
  void initState() {
    _listOfImageCubit = context.read<ListOfImageCubit>();
    _listOfImageCubit?.loadImages();
    setupScrollController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Image Gallery'),
      body: imageList(),
    );
  }

  Widget imageList() {
    return BlocBuilder<ListOfImageCubit, ListOfImageState>(
      builder: (context, state) {
        if (state is ListOfImageLoading && state.isFirstFetch) {
          return _loadingIndicator();
        }
        List<ImageModel> _imageList = [];
        bool isLoading = false;

        if (state is ListOfImageLoading) {
          _imageList = state.oldListOfImage;
          isLoading = true;
        } else if (state is ListOfImageLoaded) {
          _imageList = state.listOfImage;
        }
        return GridView.builder(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _imageList.length + (isLoading ? 1 : 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              if (index < _imageList.length) {
                return imageItemsList(_imageList[index], context);
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  scrollController
                      .jumpTo(scrollController.position.maxScrollExtent);
                });
              }
              return _loadingIndicator();
            });
      },
    );
  }

  Widget imageItemsList(ImageModel imageModel, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: ImageLoader(
          imageUrl: imageModel.downloadUrl.toString(),
        ),
      ),
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ListOfImageCubit>(context).loadImages();
        }
      }
    });
  }
}
