import 'package:aholic/widgets/ahl_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers.dart';
import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_icon_button.dart';
import '../router/app_router.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  bool _isCreateAccountBtnPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  const Align(
                    alignment: Alignment.centerRight,
                    child: AhlIconButton(
                      icon: Icons.chevron_right,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.expand_less,
              color: AhlColors.darkOrange,
            ),
            GestureDetector(
              onLongPressDown: (_) => {
                setState(() => {_isCreateAccountBtnPressed = true})
              },
              onLongPressUp: () => {
                setState(() => {_isCreateAccountBtnPressed = false})
              },
              onLongPressCancel: () => {
                setState(() => {_isCreateAccountBtnPressed = false})
              },
              onTap: () {
                ref.read(appRouterProvider).push(const RegisterRoute());
              },
              child: Hero(
                tag: 'createAccountContainer',
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: AhlColors.orange,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 100),
                      padding: EdgeInsets.only(
                          top: _isCreateAccountBtnPressed ? 8 : 16,
                          bottom: _isCreateAccountBtnPressed ? 24 : 48),
                      child: Text(
                        'label.create_account'.tr(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AhlColors.darkOrange,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
