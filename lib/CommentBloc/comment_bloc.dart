import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myanimex/models/comment_model.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial()) {
    on<LoadComment>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CommentLoaded(comments: <Comment>[]));
    });
    on<AddComment>((event, emit) {
      if (state is CommentLoaded) {
        final state = this.state as CommentLoaded;
        emit(
          CommentLoaded(
            comments: List.from(state.comments)..add(event.comment),
          ),
        );
      }
    });
    on<RemoveComment>((event, emit) {
      if (state is CommentLoaded) {
        final state = this.state as CommentLoaded;
        emit(
          CommentLoaded(
            comments: List.from(state.comments)..remove(event.comment),
          ),
        );
      }
    });
  }
}
