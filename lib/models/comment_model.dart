import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final String sender;
  final String content;

  const Comment({required this.sender, required this.content});

  @override
  List<Object?> get props => [sender, content];
}
