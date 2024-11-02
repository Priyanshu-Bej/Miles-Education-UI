import 'package:miles/core/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Homepagemodel homepagemodel = Homepagemodel.fromJson(homepageData);
  final TestimonialsModel _testimonialsData =
      TestimonialsModel.fromJson(testimonialsData);

  @override
  void initState() {
    super.initState();
    homepagemodel = Homepagemodel.fromJson(homepageData);
  }

  final _controller = IndicatorController();

  void _showTalkToUsSheet(BuildContext context) {
    Provider.of<TalkToUsProvider>(context, listen: false)
        .resetThankYouMessage();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => const TalkToUsSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Image.asset(ImageConstants.imageLogo, height: 20),
          actions: [Image.asset(ImageConstants.iconNotification, height: 60)],
        ),
        extendBodyBehindAppBar: true,
        body: CustomRefreshIndicator(
          onRefresh: () async {},
          child: Container(),
          builder: (context, child, controller) {
            return PlaneIndicator(
              controller: _controller,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.6,
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Gap(30),
                        greetings(context),
                        StoriesCard(
                          testimonialsData: _testimonialsData,
                        ),
                        const Gap(10),
                        GlobalAccountingCard(
                          homepagemodel: homepagemodel,
                        ),
                        const Gap(30),
                        feed(context),
                        const Gap(30),
                        const EventsCard(),
                        const Gap(10),
                        InshortsCard(
                          homepagemodel: homepagemodel,
                        ),
                        const Gap(10),
                        MasterclassCard(
                          homepagemodel: homepagemodel,
                        ),
                        const Gap(30),
                        madeWithLove(context),
                        const Gap(30),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }

  Container feed(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Image.asset(
        "assets/images/feed.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Row greetings(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Good Morning!",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Priyanshu",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
        InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            _showTalkToUsSheet(context);
          },
          child: Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(ImageConstants.gifCall),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}
