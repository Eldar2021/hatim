import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatim/app/app.dart';
import 'package:hatim/models/user/user_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.watch<AppCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('LoginView')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appCubit.service.locales.length,
              itemBuilder: (BuildContext context, int index) {
                final locale = context.read<AppCubit>().service.locales[index];
                final langName = context.read<AppCubit>().service.getName(locale.toLanguageTag());
                return Card(
                  color: appCubit.state.currentLocale == locale ? Colors.green : null,
                  child: ListTile(
                    title: Text(langName, locale: locale),
                    onTap: () => context.read<AppCubit>().changeLang(index),
                  ),
                );
              },
            ),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: Card(
                      color: state.gender == Gender.male ? Colors.green : null,
                      child: ListTile(
                        title: const Text('Male'),
                        onTap: () => context.read<AuthCubit>().setGender(Gender.male),
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: Card(
                      color: state.gender == Gender.female ? Colors.green : null,
                      child: ListTile(
                        title: const Text('FeMale'),
                        onTap: () => context.read<AuthCubit>().setGender(Gender.female),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            child: const Text('Start'),
            onPressed: () async {
              final user = User(gender: context.read<AuthCubit>().state.gender);
              await context.read<AuthCubit>().setUser(user);
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
