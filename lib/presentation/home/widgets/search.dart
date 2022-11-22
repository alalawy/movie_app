import 'package:flutter/material.dart';
import 'package:movie_app/infrastructure/theme/theme.dart';
import 'package:movie_app/presentation/widgets/my_flutter_app_icons.dart';

class Search extends StatelessWidget {
  Search({super.key});

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: controller,
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            hintText: 'Search',
            contentPadding: EdgeInsets.all(10),
            hintStyle:
                TextStyle(color: MovieTheme.of(context).secondaryBackground),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MovieTheme.of(context).primaryBackground,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MovieTheme.of(context).primaryBackground,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MovieTheme.of(context).primaryBackground,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MovieTheme.of(context).primaryBackground,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 47, 47, 52),
            prefixIcon: Icon(
              MovieIcons.ksearchLine,
              color: MovieTheme.of(context).secondaryColor,
            ),
          ),
          style: MovieTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: MovieTheme.of(context).secondaryBackground,
                fontWeight: FontWeight.w300,
              ),
        ),
      ),
    );
  }
}
