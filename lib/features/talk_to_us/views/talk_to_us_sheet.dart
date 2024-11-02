import 'package:miles/core/exports.dart';

class TalkToUsSheet extends StatelessWidget {
  const TalkToUsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TalkToUsProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.85),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 30.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 30.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => NavigatorService.goBack(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              provider.showThankYouMessage
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Thank You for showing interest in us!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Our SPOC will be connecting with you on your provided contact details.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                      ],
                    )
                  : Lottie.asset(
                      ImageConstants.animationSuccess,
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                      onLoaded: (composition) {
                        Future.delayed(composition.duration, () {
                          Provider.of<TalkToUsProvider>(context, listen: false)
                              .toggleThankYouMessage();
                        });
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
