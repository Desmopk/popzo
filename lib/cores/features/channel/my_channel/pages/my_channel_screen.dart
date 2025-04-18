import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../screens/error_page.dart';
import '../../../../screens/loader.dart';
import '../../../auth/provider/user_provider.dart';
import '../parts/buttons.dart';
import '../parts/tab_bar.dart';
import '../parts/tab_bar_view.dart';
import '../parts/top_header.dart';

class MyChannelScreen extends ConsumerWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
          data: (currentUser) => DefaultTabController(
            length: 7,
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      // top header

                      TopHeader(user: currentUser),
                      const Text("More about this channel"),
                      const Buttons(),

                      // create tab bar

                      const PageTabBar(),
                      const TabPages(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => const ErrorPage(),
          loading: () => const Loader(),
        );
  }
}
