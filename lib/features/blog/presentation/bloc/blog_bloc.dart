import 'dart:io';

import 'package:andreaproject/core/usecase/usecase.dart';
import 'package:andreaproject/features/blog/domain/entities/blog.dart';
import 'package:andreaproject/features/blog/domain/usecases/get_all_blogs.dart';
import 'package:andreaproject/features/blog/domain/usecases/upload_blog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;

  BlogBloc({required UploadBlog uploadBlog, required GetAllBlogs getAllBlogs})
    : _getAllBlogs = getAllBlogs,
      _uploadBlog = uploadBlog,
      super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUpload>(_onBlogUpload);
    on<BlogFetchAllBlogs>(_onFetchAllBlogs);
  }

  void _onFetchAllBlogs(
    BlogFetchAllBlogs event,
    Emitter<BlogState> emit,
  ) async {
    final res = await _getAllBlogs(NoParams());
    res.fold(
      (error) => emit(BlogFailure(error.message)),
      (blogs) => emit(BlogDisplaySuccess(blogs)),
    );
  }

  void _onBlogUpload(BlogUpload event, Emitter<BlogState> emit) async {
    final res = await _uploadBlog(
      UploadBlogParams(
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        image: event.image,
        topics: event.topics,
      ),
    );

    res.fold(
      (error) => emit(BlogFailure(error.message)),
      (blog) => emit(BlogSuccess()),
    );
  }
}
