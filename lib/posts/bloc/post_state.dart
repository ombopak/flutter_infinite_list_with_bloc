part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <Post>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState{status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length}}''';
  }

  @override
  List<Object> get props => [];
}

// Post Initial =>
//    will tell the presentation layer it needs to render a loading indicator
//    while the initial batch of posts are loaded
// class PostInitial extends PostState {}

// Post Success =>
//    will tell the presentation layer it has content to render
//    posts- will be the List<Post> which will be displayed
//    hasReachedMax- will tell the presentation layer whether
//    or not it has reached the maximum number of posts

// Post Failure =>
//    will tell the presentation layer that
//    an error has occurred while fetching posts
