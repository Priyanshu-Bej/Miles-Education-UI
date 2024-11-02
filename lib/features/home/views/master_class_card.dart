import 'package:miles/core/exports.dart';

class MasterclassCard extends StatefulWidget {
  final Homepagemodel homepagemodel;

  const MasterclassCard({super.key, required this.homepagemodel});

  @override
  _MasterclassCardState createState() => _MasterclassCardState();
}

class _MasterclassCardState extends State<MasterclassCard> {
  late Gallery3DController _controller;

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
  void _launchURL(String url) async {
    print("Url : $url");
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Could not launch $url'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Post> masterclassPosts = [];
    for (var datum in widget.homepagemodel.data ?? []) {
      for (var post in datum.posts ?? []) {
        if (post.postType == 'masterclass' && post.blogUrl != null) {
          masterclassPosts.add(post);
        }
      }
    }
    _controller = Gallery3DController(
      itemCount: masterclassPosts.length,
      ellipseHeight: 0.4,
      autoLoop: true,
      minScale: 0.4,
      delayTime: 5000,
      scrollTime: 1000,
    );
    return Column(
      children: [
        const Gap(20),
        const CustomTitle(title: "Our Programs"),
        const Gap(20),
        Gallery3D(
          controller: _controller,
          width: MediaQuery.of(context).size.width,
          itemConfig: GalleryItemConfig(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 400, // Height of the image
          ),
          onClickItem: (value) {
            final post = masterclassPosts[value];
            _launchURL(post.blogUrl ?? "");
          },
          itemBuilder: (context, index) {
            return Image.asset(
              ImageConstants.imageMasterClass,
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            );
          },
        ),
      ],
    );
  }
}
