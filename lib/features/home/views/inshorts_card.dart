import 'package:miles/core/exports.dart';

class InshortsCard extends StatelessWidget {
  final Homepagemodel homepagemodel;

  const InshortsCard({super.key, required this.homepagemodel});

  @override
  Widget build(BuildContext context) {
    List<Post> filteredPosts = [];
    for (Datum datum in homepagemodel.data ?? []) {
      for (Post post in datum.posts ?? []) {
        if (post.postType == "inshorts") {
          filteredPosts.add(post);
        }
      }
    }

    return Column(
      children: [
        const CustomTitle(title: "Accounting Unplugged"),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredPosts.length,
          itemBuilder: (context, index) {
            final post = filteredPosts[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Card(
                margin: const EdgeInsets.only(top: 10),
                elevation: 5,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/images/accounting.png",
                            height: 200,
                            width: double.infinity,
                          )

                          // CachedNetworkImage(
                          //   imageUrl: post.files?.first.thumbnail ??
                          //       "https://via.placeholder.com/150",
                          //   height: 200,
                          //   width: double.infinity,
                          //   fit: BoxFit.cover,
                          //   placeholder: (context, url) =>
                          //       const LinearProgressIndicator(),
                          //   errorWidget: (context, url, error) =>
                          //       const Icon(Icons.error),
                          // ),
                          ),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/logo2.jpg"),
                      ),
                      title: Text(
                        post.title ?? "No Title",
                        style: const TextStyle(fontSize: 13),
                      ),
                      subtitle: Text(
                        'Likes: ${post.likes ?? 0}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
