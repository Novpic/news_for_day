import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/article/remote/remote_article_bloc.dart';
import '../../bloc/article/remote/remote_article_state.dart';

class DailyNewsView extends StatelessWidget {
  const DailyNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _Body(),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    title: const Text(
      'Daily News',
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.grey[50],
  );
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
