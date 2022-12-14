import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hatim/app/logic/auth_cubit.dart';
import 'package:hatim/components/components.dart';
import 'package:hatim/l10n/l10.dart';
import 'package:hatim/models/models.dart';

class GenderSettingView extends StatelessWidget {
  const GenderSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.loginPleaseSelectGender),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        children: [
          GenderCard(
            key: const Key('settings-gender-male-button'),
            Gender.male,
            isSelect: authCubit.state.user?.gender == Gender.male,
            onTap: () => context.read<AuthCubit>().setGender(Gender.male),
          ),
          GenderCard(
            key: const Key('settings-gender-female-button'),
            Gender.female,
            isSelect: authCubit.state.user?.gender == Gender.female,
            onTap: () => context.read<AuthCubit>().setGender(Gender.female),
          ),
        ],
      ),
    );
  }
}
