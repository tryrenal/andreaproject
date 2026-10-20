import 'package:andreaproject/core/theme/app_pallate.dart';
import 'package:andreaproject/core/utils/calculate_read_time.dart';
import 'package:andreaproject/core/utils/format_date.dart';
import 'package:andreaproject/features/blog/domain/entities/blog.dart';
import 'package:flutter/material.dart';

class BlogViewerPage extends StatelessWidget {
  static route(Blog blog) =>
      MaterialPageRoute(builder: (context) => BlogViewerPage(blog: blog));

  final Blog blog;
  const BlogViewerPage({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 22),
                Text(
                  'By ${blog.posterName}',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  '${formatedDateBydMMMyyyy(blog.updatedAt)} . ${calculateReadTime(blog.content)} min',
                  style: TextStyle(color: AppPallete.greyColor, fontSize: 16),
                ),
                SizedBox(height: 22),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(blog.imageUrl),
                ),
                SizedBox(height: 22),
                Text(blog.content, style: TextStyle(fontSize: 16, height: 2)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
