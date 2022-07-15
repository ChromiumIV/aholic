import 'package:aholic/widgets/ahl_date_picker.dart';
import 'package:aholic/widgets/ahl_icon_button.dart';
import 'package:aholic/widgets/ahl_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_checkbox.dart';
import '../../widgets/ahl_color_picker.dart';
import '../../widgets/ahl_combo_box.dart';
import '../../widgets/ahl_date_time_picker.dart';
import '../../widgets/ahl_scaffold.dart';

class CreateEventPage extends ConsumerStatefulWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEventPageState();
}

class _CreateEventPageState extends ConsumerState<CreateEventPage> {
  bool _isAllDay = false;
  Color _color = AhlColors.orange;

  @override
  Widget build(BuildContext context) {
    return AhlScaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          decoration: const BoxDecoration(
            color: AhlColors.orange,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(24)),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'title.new_event'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: AhlColors.darkOrange),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AhlIconButton(
                    icon: Icons.close,
                    fillColor: Colors.white.withOpacity(0.2),
                    iconColor: AhlColors.darkOrange,
                    hoverIconColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AhlIconButton(
                    icon: Icons.check,
                    fillColor: Colors.white.withOpacity(0.2),
                    iconColor: AhlColors.darkOrange,
                    hoverIconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 36),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                AhlTextField(
                  hintText: 'label.title'.tr(),
                  fillColor: AhlColors.orange.withOpacity(0.2),
                  textColor: AhlColors.darkOrange,
                  hintColor: AhlColors.darkOrange.withOpacity(0.5),
                  padding: const EdgeInsets.only(bottom: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _isAllDay
                            ? AhlDatePicker(
                                fillColor: AhlColors.orange,
                                textColor: AhlColors.darkOrange,
                                datePickerSubtitle: 'label.from'.tr(),
                                value: DateTime.now(),
                                padding: const EdgeInsets.all(0),
                              )
                            : AhlDateTimePicker(
                                fillColor: AhlColors.orange,
                                textColor: AhlColors.darkOrange,
                                datePickerSubtitle: 'label.from'.tr(),
                                value: DateTime.now(),
                                padding: const EdgeInsets.all(0),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'label.to_lower'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: AhlColors.darkOrange),
                        ),
                      ),
                      Expanded(
                        child: _isAllDay
                            ? AhlDatePicker(
                                fillColor: AhlColors.orange,
                                textColor: AhlColors.darkOrange,
                                datePickerSubtitle: 'label.to'.tr(),
                                value: DateTime.now(),
                                padding: const EdgeInsets.all(0),
                              )
                            : AhlDateTimePicker(
                                fillColor: AhlColors.orange,
                                textColor: AhlColors.darkOrange,
                                datePickerSubtitle: 'label.to'.tr(),
                                value: DateTime.now(),
                                padding: const EdgeInsets.all(0),
                              ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AhlCheckbox(
                    label: 'label.all_day'.tr(),
                    fillColor: AhlColors.orange,
                    textColor: AhlColors.darkOrange,
                    padding: const EdgeInsets.only(bottom: 16),
                    value: _isAllDay,
                    onChanged: (isAllDay) =>
                        setState(() => _isAllDay = isAllDay),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          'label.add_to'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: AhlColors.darkOrange),
                        ),
                      ),
                      Expanded(
                        child: AhlComboBox(
                          title: 'title.select_timeline'.tr(),
                          items: [
                            'Work',
                            'Private',
                            'Test1',
                            'Test2',
                            'Test3',
                            'Official Calendar 2022',
                            'Aholic',
                            'Awesome App'
                          ],
                          selectedItem: 'Work',
                          fillColor: AhlColors.orange,
                          textColor: AhlColors.darkOrange,
                        ),
                      ),
                    ],
                  ),
                ),
                AhlTextField(
                  hintText: 'label.location'.tr(),
                  fillColor: AhlColors.orange.withOpacity(0.2),
                  textColor: AhlColors.darkOrange,
                  hintColor: AhlColors.darkOrange.withOpacity(0.5),
                  padding: const EdgeInsets.only(bottom: 16),
                ),
                AhlTextField(
                  hintText: 'label.note'.tr(),
                  fillColor: AhlColors.orange.withOpacity(0.2),
                  textColor: AhlColors.darkOrange,
                  hintColor: AhlColors.darkOrange.withOpacity(0.5),
                  padding: const EdgeInsets.only(bottom: 16),
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 6,
                ),
                Row(
                  children: [
                    AhlColorPicker(
                      value: _color,
                      onSelected: (selectedColor) => setState(() {
                        _color = selectedColor;
                      }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
