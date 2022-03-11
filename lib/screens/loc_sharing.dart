import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:guard_app/providers/providers.dart';
import 'package:guard_app/widgets/logo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocSharingPage extends StatefulHookConsumerWidget {
  const LocSharingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocSharingPageState();
}

class _LocSharingPageState extends ConsumerState<LocSharingPage> {
  @override
  void initState() {
    if (ref.read(locationProvider).isAwaitingPermissions) {
      ref.read(locationProvider.notifier).checkPremission();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationProvider);
    final locationStateNotifier = ref.watch(locationProvider.notifier);
    final accountProv = ref.watch(accountProvider).account;
    final authProv = ref.watch(authProvider.notifier);

    if (locationState.isPermissionGranted && !locationState.isLocating) {
      locationStateNotifier
          .initializeTracking()
          .then((value) => locationStateNotifier.beginTracking());
    }

    if (ref.read(accountProvider).account == null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) => setState(() {}));
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Card(
                  margin: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Logo(width: 100),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.background,
                                child: Text(getInitials(accountProv?.name)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                accountProv?.name ?? "No Name",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 20),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    await authProv.logout();
                                    Beamer.of(context).beamToNamed('/login');
                                  },
                                  icon: const Icon(Icons.logout))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getInitials(String? name) => name?.isNotEmpty ?? false
    ? name!.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : 'NN';
