import 'package:coco_explorer/core/presentation/widgets/error_view.dart';
import 'package:coco_explorer/core/presentation/widgets/loader.dart';
import 'package:coco_explorer/core/presentation/widgets/screen_loader.dart';
import 'package:coco_explorer/core/presentation/widgets/screen_utils.dart';
import 'package:coco_explorer/features/explorer/presentation/blocs/image_ids/image_ids_bloc.dart';
import 'package:coco_explorer/features/explorer/presentation/blocs/images_details/images_details_list_bloc.dart';
import 'package:coco_explorer/features/explorer/presentation/delegates/coco_images_search_delegate.dart';
import 'package:coco_explorer/features/explorer/presentation/providers/tags_selected_provider.dart';
import 'package:coco_explorer/features/explorer/presentation/widgets/image_coco_card.dart';
import 'package:coco_explorer/features/explorer/presentation/widgets/image_loader_widget.dart';
import 'package:coco_explorer/features/explorer/presentation/widgets/selected_tags_widget.dart';
import 'package:coco_explorer/gen/assets.gen.dart';
import 'package:coco_explorer/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CoCoExplorerPage extends StatefulWidget {
  const CoCoExplorerPage({Key? key}) : super(key: key);

  @override
  State<CoCoExplorerPage> createState() => _CoCoExplorerPageState();
}

class _CoCoExplorerPageState extends State<CoCoExplorerPage>
    with ScreenUtils, ScreenLoader {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  late final ImageIdsBloc imageIdsBloc;

  late final ImagesDetailsListBloc imagesDetailsListBloc =
      getIt<ImagesDetailsListBloc>();

  @override
  void initState() {
    imageIdsBloc = BlocProvider.of<ImageIdsBloc>(context);

    super.initState();
  }

  @override
  Widget screen(BuildContext context) {
    return BlocListener<ImageIdsBloc, ImageIdsState>(
      listener: (context, state) {
        if (state is ImageIdsSuccess) {
          getImagesFirstPage();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Assets.images.cocoLogo.path,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: _openCocoImagesSearchDelegate,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text('tags..'.tr()),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        ElevatedButton(
                          onPressed: _searchInCocoDataSet,
                          child: Text('search'.tr()),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const SelectedTagsWidget(),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ImageIdsBloc, ImageIdsState>(
                bloc: imageIdsBloc,
                builder: (context, state) {
                  if (state is ImageIdsLoading) {
                    return const Loader();
                  } else if (state is ImageIdsFailure) {
                    return Center(
                      child: ErrorView(
                        failure: state.failure,
                        onRetry: _searchInCocoDataSet,
                      ),
                    );
                  } else if (state is ImageIdsSuccess) {
                    return BlocListener<ImagesDetailsListBloc,
                        ImagesDetailsListState>(
                      bloc: imagesDetailsListBloc,
                      listener: (context, state) {
                        if (state is ImagesDetailsListGetMoreFailure) {
                          handleError(
                            failure: state.failure,
                          );
                        }
                      },
                      child: BlocBuilder<ImagesDetailsListBloc,
                          ImagesDetailsListState>(
                        bloc: imagesDetailsListBloc,
                        builder: (context, state) {
                          if (state is ImagesDetailsListLoading) {
                            return const ImageLoaderWidget();
                          } else if (state is ImagesDetailsListFailure) {
                            return Center(
                              child: ErrorView(
                                failure: state.failure,
                                onRetry: () {
                                  // TODO
                                },
                              ),
                            );
                          } else {
                            return imagesDetailsListBloc.images.isEmpty
                                ? Text('no_result'.tr())
                                : SmartRefresher(
                                    controller: _refreshController,
                                    onRefresh: _onRefresh,
                                    enablePullDown: true,
                                    enablePullUp: true,
                                    onLoading: _onLoading,
                                    header: MaterialClassicHeader(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                    footer: CustomFooter(
                                      builder: (BuildContext context,
                                          LoadStatus? mode) {
                                        Widget footerBody;
                                        if (mode == LoadStatus.loading ||
                                            (state
                                                is ImagesDetailsListLoadingMoreData)) {
                                          footerBody = const Loader();
                                        } else {
                                          footerBody = const SizedBox.shrink();
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: Center(child: footerBody),
                                        );
                                      },
                                    ),
                                    child: ListView.separated(
                                      padding: const EdgeInsets.all(8),
                                      shrinkWrap: true,
                                      itemCount:
                                          imagesDetailsListBloc.images.length,
                                      itemBuilder: (context, index) {
                                        return ImageCocoCard(
                                          coCoImage: imagesDetailsListBloc.images[index],
                                        );
                                      },
                                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                                    ),
                                  );
                          }
                        },
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _searchInCocoDataSet() {
    imageIdsBloc.add(
      ImageIdsGetImageIds(
        categoryIds: Provider.of<TagsSelectedProvider>(context, listen: false)
            .selectedImagesIds,
      ),
    );
  }

  void _openCocoImagesSearchDelegate() async {
    await showSearch(
      context: context,
      delegate: COCOImagesSearchDelegate(),
    );
  }

  void getImagesFirstPage() {
    imagesDetailsListBloc.add(ImagesDetailsListGetImages());
  }

  void getMoreImages() {
    imagesDetailsListBloc.add(ImagesDetailsListGetMoreImages());
  }

  void _onRefresh() async {
    getImagesFirstPage();
    if (mounted) setState(() {});
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    if (imagesDetailsListBloc.canLoadMore &&
        imagesDetailsListBloc.state is! ImagesDetailsListLoadingMoreData) {
      getMoreImages();
    }

    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }
}
