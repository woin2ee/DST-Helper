import 'package:dst_helper/cook_page/recipe_card_table.dart';
import 'package:dst_helper/cook_page/recipe_list/recipe_list.dart';
import 'package:flutter/material.dart';

class CookPage extends StatefulWidget {
  const CookPage({super.key});

  @override
  State<CookPage> createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        spacing: 10,
        children: [
          const Expanded(
            child: RecipeCardTable(),
          ),
          RecipeList(),
        ],
      ),
    );
  }
}
