import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CircularProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final String name;

  const CircularProfileAvatar(
      {super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage: CachedNetworkImageProvider(imageUrl),
              ),
              // Asset image as the border
              Container(
                width: 80.0, // Adjust the size according to your border image
                height: 80.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/circle.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const Gap(5),
          Text(name,
              style: const TextStyle(
                  fontSize: 13, color: Colors.white)), // Display the name
        ],
      ),
    );
  }
}
