import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/features/explorer/domain/entities/coco_image.dart';
import 'package:coco_explorer/features/explorer/domain/usecases/get_images_details_by_ids_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'images_details_list_state.dart';

part 'images_details_list_event.dart';

@injectable
class ImagesDetailsListBloc
    extends Bloc<ImagesDetailsListEvent, ImagesDetailsListState> {
  final GetImagesDetailsByIdsUseCase getImagesDetailsByIdsUseCase;

  int currentPage = 1;
  bool canLoadMore = true;
  final List<CoCoImage> images = [];

  ImagesDetailsListBloc({
    required this.getImagesDetailsByIdsUseCase,
  }) : super(ImagesDetailsListInitial()) {
    on<ImagesDetailsListGetImages>(
      (event, emit) async {
        currentPage = 1;
        canLoadMore = true;
        images.clear();
        emit(ImagesDetailsListLoading());
        final result = await getImagesDetailsByIdsUseCase(
          GetImagesDetailsByIdsUseCaseParams(page: currentPage),
        );
        emit(
          result.fold((l) => ImagesDetailsListFailure(failure: l), (r) {
            if (r.isEmpty) {
              canLoadMore = false;
            }
            currentPage = currentPage + 1;
            images.addAll(r);
            return ImagesDetailsListSuccess(images: images);
          }),
        );
      },
    );

    on<ImagesDetailsListGetMoreImages>(
      (event, emit) async {
        if (canLoadMore) {
          emit(ImagesDetailsListLoadingMoreData());
          final result = await getImagesDetailsByIdsUseCase(
            GetImagesDetailsByIdsUseCaseParams(page: currentPage),
          );
          emit(
            result.fold((l) => ImagesDetailsListGetMoreFailure(failure: l),
                (r) {
              if (r.isEmpty) {
                canLoadMore = false;
              }
              currentPage = currentPage + 1;

              images.addAll(r);
              return ImagesDetailsListSuccess(images: images);
            }),
          );
        }
      },
    );
  }
}
