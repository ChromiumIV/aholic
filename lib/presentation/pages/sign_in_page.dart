import 'package:aholic/widgets/ahl_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 120, bottom: 36),
                  child: SafeArea(
                    child: Text(
                      'title.sign_in'.tr(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ),
              AhlTextField(
                hintText: 'label.email'.tr(),
              ),
              AhlTextField(
                hintText: 'label.password'.tr(),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
