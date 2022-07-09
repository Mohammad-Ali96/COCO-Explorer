import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/features/explorer/domain/usecases/get_image_ids_by_category_ids_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'image_ids_event.dart';

part 'image_ids_state.dart';

@injectable
class ImageIdsBloc extends Bloc<ImageIdsEvent, ImageIdsState> {
  final GetImageIdsByCategoryIdsUseCase getImageIdsIdsUseCase;

  ImageIdsBloc({
    required this.getImageIdsIdsUseCase,
  }) : super(ImageIdsInitial()) {
    on<ImageIdsGetImageIds>(
      (event, emit) async {
        emit(ImageIdsLoading());
        final result = await getImageIdsIdsUseCase(
            GetImageIdsByCategoryIdsUseCaseParams(
                categoryIds: event.categoryIds));
        emit(
          result.fold(
            (l) => ImageIdsFailure(failure: l),
            (r) => ImageIdsSuccess(imagesIds: r),
          ),
        );
      },
    );
  }
}
