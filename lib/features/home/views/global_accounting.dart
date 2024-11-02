import 'package:miles/core/exports.dart';

class GlobalAccountingCard extends StatelessWidget {
  final Homepagemodel homepagemodel;

  const GlobalAccountingCard({super.key, required this.homepagemodel});

  @override
  Widget build(BuildContext context) {
    // Create a flat list of all posts that are reels
    List filteredPosts = homepagemodel.data
            ?.expand(
                (datum) => datum.blockType == 'reels' ? datum.posts ?? [] : [])
            .where((post) => post.postType == 'reels')
            .toList() ??
        [];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CustomTitle(
            title: "The Global Accountant",
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              childAspectRatio: 0.6,
            ),
            itemCount: filteredPosts.length,
            itemBuilder: (context, index) {
              final post = filteredPosts[index];
              String imageUrl = post.files?.first.thumbnail ?? '';
              String videoUrl = post.files?.first.videoUrl ?? '';

              return buildCard(
                context: context,
                title: post.title ?? 'Untitled',
                subtitle: post.description ?? 'No description provided',
                imageUrl: imageUrl,
                videoUrl: videoUrl,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String imageUrl,
    required String videoUrl,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.youtubeVideoPage,
          arguments: {'videoLink': videoUrl},
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(24),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
              Colors.blue,
              Colors.purple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(24),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/milesAlumini.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                // Image.network(
                //   imageUrl,
                //   fit: BoxFit.cover,
                //   width: double.infinity,
                //   height: double.infinity,
                //   errorBuilder: (context, error, stackTrace) => Container(
                //     color: Colors.grey.shade800,
                //     child: const Center(
                //       child: Icon(Icons.image, color: Colors.white70, size: 50),
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.youtubeVideoPage,
                        arguments: {'videoLink': videoUrl},
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.withOpacity(0.1),
                            Colors.grey.withOpacity(0.1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade900.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(15), // Adjusted border radius
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 16), // Smaller icon size
                          SizedBox(
                              width: 5), // Less spacing between icon and text
                          Text(
                            'Watch Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12, // Smaller font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
