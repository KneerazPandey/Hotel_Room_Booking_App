import 'package:flutter/material.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/models/blog.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;

  const BlogCard({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 1),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "${GlobalUrl.accessImageUrl}/${blog.image}/",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 8,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Colors.redAccent,
                    )),
                    const SizedBox(width: 8),
                    const Icon(Icons.calendar_month),
                    const SizedBox(width: 8),
                    Text(
                      blog.created.substring(0, 10),
                      style: GoogleFonts.poppins(
                        color: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Colors.redAccent,
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  blog.title,
                  style: GoogleFonts.sansita(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  blog.description,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
