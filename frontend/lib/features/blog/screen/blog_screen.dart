import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/blog/services/blog_services.dart';
import 'package:frontend/features/blog/widgets/blog_card.dart';
import 'package:frontend/models/blog.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogScreen extends StatefulWidget {
  static const String routeName = 'Blog';

  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final BlogServices _blogServices = BlogServices();
  List<Blog> _blogs = [];

  @override
  void initState() {
    getBlogs();
    super.initState();
  }

  void getBlogs() async {
    List<Blog> blogs = await _blogServices.getBlogs(context: context);
    setState(() {
      _blogs = blogs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFefefef),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'News And Blog',
                    style: GoogleFonts.sansita(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.isDesktop(context) ? 64 : 42,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 10,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 580,
                  child: ListView.builder(
                    itemCount: _blogs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 360,
                        height: 520,
                        margin: EdgeInsets.symmetric(
                          horizontal: Responsive.isDesktop(context)
                              ? 30
                              : Responsive.isTablet(context)
                                  ? 20
                                  : 10,
                        ),
                        child: BlogCard(blog: _blogs[index]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
