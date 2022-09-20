part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class LoadComment extends CommentEvent {}

class AddComment extends CommentEvent {
  final Comment comment;

  const AddComment(this.comment);

  @override
  List<Object> get props => [comment];
}

class RemoveComment extends CommentEvent {
  final Comment comment;

  const RemoveComment(this.comment);

  @override
  List<Object> get props => [comment];
}
