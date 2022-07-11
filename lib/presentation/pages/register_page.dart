import 'package:aholic/presentation/behaviors/non_glowing_scroll_behavior.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers.dart';
import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_button.dart';
import '../../widgets/ahl_icon_button.dart';
import '../../widgets/ahl_page_indicator.dart';
import '../../widgets/ahl_text_field.dart';
import '../router/app_router.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _pageController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Hero(
          tag: 'createAccountContainer',
          child: Container(
            color: AhlColors.orange,
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: NonGlowingScrollBehavior(),
                      child: PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: [
                          _buildEmailPage(),
                          _buildPasswordPage(),
                          _buildVerifyEmailPage(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    child: Row(
                      children: [
                        AhlIconButton(
                          icon: Icons.chevron_left,
                          fillColor: Colors.white.withOpacity(0.5),
                          iconColor: AhlColors.darkOrange,
                          hoverIconColor: Colors.white,
                          onTap: () {
                            _pageController.previousPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          },
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: AhlPageIndicator(
                              currentItem: _currentPage,
                              itemCount: 3,
                              activeColor: AhlColors.darkOrange,
                              inactiveColor:
                                  AhlColors.darkOrange.withOpacity(0.2),
                            ),
                          ),
                        ),
                        AhlIconButton(
                          icon: Icons.chevron_right,
                          fillColor: Colors.white.withOpacity(0.5),
                          iconColor: AhlColors.darkOrange,
                          hoverIconColor: Colors.white,
                          onTap: () {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120, bottom: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'title.register_email'.tr(),
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: AhlColors.darkOrange,
                    ),
              ),
            ),
          ),
          AhlTextField(
            hintText: 'label.email'.tr(),
            fillColor: Colors.white.withOpacity(0.5),
            textColor: AhlColors.darkOrange,
            hintColor: AhlColors.darkOrange.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120, bottom: 36),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'title.register_password'.tr(),
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: AhlColors.darkOrange,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'message.register_password'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AhlColors.darkOrange),
              ),
            ),
          ),
          AhlTextField(
            hintText: 'label.password'.tr(),
            obscureText: true,
            fillColor: Colors.white.withOpacity(0.5),
            textColor: AhlColors.darkOrange,
            hintColor: AhlColors.darkOrange.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyEmailPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120, bottom: 36),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'title.register_verify_email'.tr(),
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: AhlColors.darkOrange,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 36),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'message.register_verify_email'
                    .tr(namedArgs: {'email': 'replaceme@gmail.com'}),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AhlColors.darkOrange),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: AhlButton(
              text: 'label.open_mail_app'.tr(),
              fillColor: Colors.white,
              textColor: AhlColors.darkOrange,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: AhlButton(
              text: 'label.resend_email'.tr(),
              fillColor: Colors.white,
              textColor: AhlColors.darkOrange,
              isEnabled: false,
            ),
          ),
        ],
      ),
    );
  }
}
