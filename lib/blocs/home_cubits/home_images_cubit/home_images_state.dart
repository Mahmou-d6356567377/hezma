part of 'home_images_cubit.dart';

sealed class HomeImagesState extends Equatable {
  const HomeImagesState();

  @override
  List<Object> get props => [];
}

final class HomeImagesInitial extends HomeImagesState {}

final class HomeImagesLoading extends HomeImagesState {}

final class HomeImagesSuccess extends HomeImagesState {
  final List<Category> homeImages;

  const HomeImagesSuccess(this.homeImages);
}

final class HomeImagesFailure extends HomeImagesState {
  final String errMsg;

  const HomeImagesFailure(this.errMsg);
}
