import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationAccessCard extends HookConsumerWidget {
  const LocationAccessCard({Key? key, required this.callback})
      : super(key: key);

  final void Function()? callback;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.share_location_rounded,
                size: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Gatego will track your location",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Gatego Driver collects location data to enable navigation"
                ", location sharing, & driver monitoring even when the app"
                " is closed or not in use.",
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "You can control this at any time by clicking on the "
                "button located on the bottom left-hand-side of the map",
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "You must accept the use of location data in order to use "
                "this application as its core functionality is location reporting.",
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "By clicking below you are acknowledging that you allow gatego"
                " to collect this data in accordance to our privacy policy."
                " Our privacy policy is available at "
                "https://cloud.gatego.io/privacy-policy",
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Text(
                  "Confirm",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(
                      vertical: 13,
                    ),
                  ),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50000),
                    ),
                  ),
                ),
                onPressed: callback,
                label: const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
