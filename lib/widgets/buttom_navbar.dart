import 'package:miles/core/exports.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.transparent,
      // elevation: 0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Background curve image with a convex effect
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: ConvexCustomClipper(),
              child: Image.asset(
                'assets/images/buttomCurve2.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 60, // Adjust the height to fit your design
              ),
            ),
          ),
          // Icons Row using asset images
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, // Adjusted for better spacing
              children: <Widget>[
                _buildImageButton(ImageConstants.iconHome, context),
                _buildImageButton(ImageConstants.iconReels, context),
                _buildImageButton(ImageConstants.iconTorch, context),
                _buildImageButton(ImageConstants.iconEvent, context),
                _buildImageButton(ImageConstants.iconProfile, context),
              ],
            ),
          ),
          const Positioned(
            bottom: -20,
            child: ImageTextOverlay(),
          ),
        ],
      ),
    );
  }

  Widget _buildImageButton(String imagePath, BuildContext context,
      {double iconSize = 28}) {
    return IconButton(
      iconSize: iconSize,
      icon: Image.asset(imagePath,
          color: Colors.white, width: iconSize, height: iconSize),
      onPressed: () {},
    );
  }
}

class ImageTextOverlay extends StatelessWidget {
  const ImageTextOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/bottomCurve.png', // Ensure this is the correct path
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          const Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom clipper for convex shape
class ConvexCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 30, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
