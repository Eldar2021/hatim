import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hatim/components/components.dart';
import 'package:hatim/l10n/l10.dart';
import 'package:hatim/models/models.dart';
import 'package:hatim/modules/modules.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => QuranCubit(),
        child: const QuranBody(),
      ),
    );
  }
}

class QuranBody extends StatelessWidget {
  const QuranBody({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        key: const Key('quran-view'),
        title: Text(context.l10n.quran),
        backgroundColor: colorScheme.surfaceVariant,
        bottom: TabBar(
          indicatorColor: colorScheme.primary,
          labelColor: colorScheme.onSurfaceVariant,
          tabs: [
            PageViewCard(page: context.l10n.juzs, key: const Key('juz-items')),
            PageViewCard(page: context.l10n.surahs, key: const Key('surah-items')),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          PageViewItem<Juz>(context.read<QuranCubit>().juzs),
          PageViewItem<Surah>(context.read<QuranCubit>().surahs),
        ],
      ),
    );
  }
}
