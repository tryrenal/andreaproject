import 'package:andreaproject/core/error/failures.dart';
import 'package:andreaproject/core/usecase/usecase.dart';
import 'package:andreaproject/features/blog/domain/entities/blog.dart';
import 'package:andreaproject/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBlogs implements Usecase<List<Blog>, NoParams> {
  final BlogRepository blogRepository;

  GetAllBlogs(this.blogRepository);

  @override
  Future<Either<Failures, List<Blog>>> call(NoParams params) async {
    return await blogRepository.getAllBlogs();
  }
}
