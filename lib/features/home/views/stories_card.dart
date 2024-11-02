import 'package:miles/core/exports.dart';

class StoriesCard extends StatelessWidget {
  final TestimonialsModel testimonialsData;
  const StoriesCard({super.key, required this.testimonialsData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: testimonialsData.data?.map((data) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.youtubeVideoPage,
                    arguments: {'videoLink': data.videoUrl ?? ''},
                  );
                  print(data.videoUrl ?? 'No Video URL');
                },
                child: Column(
                  children: [
                    CircularProfileAvatar(
                      imageUrl:
                          'https://img.freepik.com/free-photo/close-up-portrait-young-man-isolated-black-studio-background-photoshot-real-emotions-male-model-crying-throught-laughting-smiling-facial-expression-human-emotions-concept_155003-25587.jpg',
                      name: data.firstName ?? "N/A",
                    ),
                  ],
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }
}
