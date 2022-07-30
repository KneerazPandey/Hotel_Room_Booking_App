import 'package:flutter/material.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/gallery/services/gallery_services.dart';
import 'package:frontend/features/gallery/widgets/gallery_button.dart';
import 'package:frontend/models/gallery.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryScreen extends StatefulWidget {
  static const String routeName = 'Gallery';

  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final GalleryService _galleryService = GalleryService();
  List<Gallery> _gallery = [];

  @override
  void initState() {
    getGalleryImage('');
    super.initState();
  }

  void getGalleryImage(String query) async {
    List<Gallery> list =
        await _galleryService.getGalleryImages(context: context, query: query);
    setState(() {
      _gallery = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                ],
              ),
              Text(
                'Photo Gallery',
                style: GoogleFonts.sansita(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    GalleryButton(
                      text: 'ALL',
                      onPressed: () {
                        getGalleryImage('');
                      },
                    ),
                    GalleryButton(
                      text: 'SPA',
                      onPressed: () {
                        getGalleryImage('SPA');
                      },
                    ),
                    GalleryButton(
                      text: 'RESTAURANT',
                      onPressed: () {
                        setState(() {
                          getGalleryImage('RESTAURANT');
                        });
                      },
                    ),
                    GalleryButton(
                      text: 'ROOM',
                      onPressed: () {
                        getGalleryImage('ROOM');
                      },
                    ),
                    GalleryButton(
                      text: 'ACTIVITY',
                      onPressed: () {
                        getGalleryImage('ACTIVITY');
                      },
                    ),
                    GalleryButton(
                      text: 'POOL',
                      onPressed: () {
                        getGalleryImage('POOL');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 600,
                width: MediaQuery.of(context).size.width - 180,
                child: _gallery.isEmpty
                    ? Container()
                    : GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Responsive.isDesktop(context)
                              ? 3
                              : Responsive.isTablet(context)
                                  ? 2
                                  : 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: Responsive.isDesktop(context)
                              ? 1.3
                              : Responsive.isTablet(context)
                                  ? 1.2
                                  : 1.1,
                        ),
                        itemCount: _gallery.length,
                        itemBuilder: (BuildContext context, int index) {
                          String image = _gallery[index].image;
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${GlobalUrl.accessImageUrl}/$image/",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
