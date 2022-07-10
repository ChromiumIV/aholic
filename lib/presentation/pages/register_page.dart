import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers.dart';
import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_icon_button.dart';
import '../../widgets/ahl_text_field.dart';
import '../router/app_router.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _pageController = PageController();

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
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildEmailPage(),
                        Text('Page 2'),
                        Text('Page 3'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        AhlIconButton(
                          icon: Icons.chevron_left,
                          fillColor: Colors.white.withOpacity(0.5),
                          iconColor: AhlColors.darkOrange,
                          onTap: () {
                            _pageController.previousPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          },
                        ),
                        Expanded(child: Text('123')),
                        AhlIconButton(
                          icon: Icons.chevron_right,
                          fillColor: Colors.white.withOpacity(0.5),
                          iconColor: AhlColors.darkOrange,
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
}
