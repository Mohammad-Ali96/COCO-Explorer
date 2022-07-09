part of 'images_details_list_bloc.dart';

@immutable
abstract class ImagesDetailsListState {}

class ImagesDetailsListInitial extends ImagesDetailsListState {}

class ImagesDetailsListLoading extends ImagesDetailsListState {}

class ImagesDetailsListLoadingMoreData extends ImagesDetailsListState {}


class ImagesDetailsListSuccess extends ImagesDetailsListState {
  final List<CoCoImage> images;

  ImagesDetailsListSuccess({
    required this.images,
  });
}



class ImagesDetailsListFailure extends ImagesDetailsListState {
  final Failure failure;

  ImagesDetailsListFailure({
    required this.failure,
  });
}

class ImagesDetailsListGetMoreFailure extends ImagesDetailsListState {
  final Failure failure;

  ImagesDetailsListGetMoreFailure({
    required this.failure,
  });
}