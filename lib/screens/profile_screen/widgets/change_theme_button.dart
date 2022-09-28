import 'package:day_4/constants/colors.dart';
import 'package:day_4/providers/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      activeColor: Colors.blueGrey.shade900,
      inactiveTrackColor: Colors.blueGrey,
      activeTrackColor: kDarkSunColor,
      inactiveThumbImage: const AssetImage('assets/images/Moon2.png'),
      activeThumbImage: const AssetImage('assets/images/sun_light_mode.webp'),
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
