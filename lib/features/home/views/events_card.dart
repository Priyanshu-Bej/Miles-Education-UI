import 'package:miles/core/exports.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      "assets/images/event1.png",
      "assets/images/event2.jpg",
      "assets/images/event3.jpg",
    ];

    return Column(
      children: [
        const CustomTitle(title: "Upcoming Events"),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
          ),
          items: imgList
              .map((item) => Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: Image.asset(
                          item,
                          fit: BoxFit.fitWidth,
                        ),
                      );
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}
