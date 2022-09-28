import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/product.dart';
import '../../../providers/themes.dart';
import 'search_grid.dart';

class MySearchDelegate extends SearchDelegate {
  final String? hintText;
  MySearchDelegate({
    this.hintText = 'Search ',
  });

  @override
  String? get searchFieldLabel => hintText;

  ThemeData appBarTheme(BuildContext context) {
    final _icontheme =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    assert(theme != null);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        brightness: colorScheme.brightness,
        backgroundColor: colorScheme.brightness == Brightness.dark
            ? kContainerDarkColor
            : kLightBackground,
        iconTheme:
            IconThemeData(color: _icontheme ? Colors.white : kPrimaryColor),
        textTheme: theme.textTheme,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
      icon: const Icon(
        Icons.clear,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> searchResults = Provider.of<Products>(
      context,
      listen: false,
    ).PRODUCTS;
    List<Product> suggestions = searchResults.where((search) {
      final result = search.shortName.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    final suggest = [...suggestions.map((e) => e.shortName).toSet().toList()];
    var seen = <String>{};
    var uniqueList = suggest.where((sn) => seen.add(sn)).toList();

    return query == ''
        ? Container()
        : ListView(
            physics: BouncingScrollPhysics(),
            children: uniqueList
                .map(
                  (e) => ListTile(
                    title: Text(
                      e,
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => Grid(e),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> searchResults = Provider.of<Products>(
      context,
      listen: false,
    ).PRODUCTS;
    List<Product> suggestions = searchResults.where(
      (search) {
        final result = search.shortName.toLowerCase();
        final input = query.toLowerCase();

        return result.contains(input);
      },
    ).toList();
    final suggest = [...suggestions.map((e) => e.shortName).toSet().toList()];
    var seen = <String>{};
    var uniqueList = suggest.where((sn) => seen.add(sn)).toList();

    return query == ''
        ? Container()
        : ListView(
            physics: const BouncingScrollPhysics(),
            children: uniqueList
                .map(
                  (e) => ListTile(
                    title: Text(
                      e,
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => Grid(e),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          );
  }
}
