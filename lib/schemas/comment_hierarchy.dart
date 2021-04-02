import 'comment.dart';

/// This class is used to store comments as a hierarchy.
class CommentHierarchy {
  /// Parent comment.
  final Comment comment;

  /// Replies to the parent comment.
  final List<CommentHierarchy>? children;

  CommentHierarchy({
    required this.comment,
    this.children,
  });

  @override
  String toString() {
    return '$comment, children: [$children]';
  }
}
