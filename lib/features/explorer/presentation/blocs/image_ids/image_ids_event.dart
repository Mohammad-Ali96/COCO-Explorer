part of 'image_ids_bloc.dart';

@immutable
abstract class ImageIdsEvent {}

class ImageIdsGetImageIds extends ImageIdsEvent {
  final List<int> categoryIds;

  ImageIdsGetImageIds({required this.categoryIds});
}
