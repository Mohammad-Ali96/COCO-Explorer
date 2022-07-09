part of 'image_ids_bloc.dart';

@immutable
abstract class ImageIdsState {}

class ImageIdsInitial extends ImageIdsState {}

class ImageIdsLoading extends ImageIdsState {}

class ImageIdsSuccess extends ImageIdsState {
  final List<int> imagesIds;

  ImageIdsSuccess({
    required this.imagesIds,
  });
}

class ImageIdsFailure extends ImageIdsState {
  final Failure failure;

  ImageIdsFailure({
    required this.failure,
  });
}
