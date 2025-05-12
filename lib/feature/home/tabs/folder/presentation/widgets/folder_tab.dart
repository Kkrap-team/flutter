import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/feature/home/tabs/folder/presentation/widgets/my_folder.dart';

class ForderTab extends ConsumerStatefulWidget {
  const ForderTab({super.key});

  @override
  ConsumerState<ForderTab> createState() => _ForderTabState();
}

class _ForderTabState extends ConsumerState<ForderTab> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Stack(children: [MyFolder()])));
  }
}
