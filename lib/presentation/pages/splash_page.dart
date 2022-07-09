import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E2241),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 114,
            ),
            const Spacer(),
            Text(
              'app_name'.tr(),
              style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'message.splash'.tr(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7C92B5),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: const Color(0xFFDFED3C),
                    ),
                  ),
                  Container(width: 4),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: const Color(0xFFD7A5F5),
                    ),
                  ),
                  Container(width: 4),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: const Color(0xFFFC9385),
                    ),
                  ),
                  Container(width: 4),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: const Color(0xFFFDD548),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
