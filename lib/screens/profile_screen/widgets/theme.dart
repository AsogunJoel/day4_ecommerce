import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/themes.dart';
import 'change_theme_button.dart';

class Theming extends StatelessWidget {
  const Theming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          children: [
            Consumer<ThemeProvider>(
              builder: (_, value, ch) {
                return Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      child: Icon(
                        value.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                        color: value.isDarkMode
                            ? kDarkPrimaryColor
                            : kPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: value.isDarkMode
                          ? const Text(
                              'Light Mode',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          : const Text(
                              'Dark Mode',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            const ChangeThemeButtonWidget(),
          ],
        ),
      ),
    );
  }
}
