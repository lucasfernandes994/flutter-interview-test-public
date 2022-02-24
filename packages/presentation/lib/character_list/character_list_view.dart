import 'package:core/base/base_state.dart';
import 'package:core/base/view_state.dart';
import 'package:core/widges/loading_widget_maker.dart';
import 'package:domain/entities/character.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/base_scaffold.dart';
import 'package:presentation/base/error_view.dart';
import 'package:presentation/base/loading_view.dart';

import 'character_card_view.dart';
import 'character_controller.dart';

class CharacterListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CharacterListState();

  final CharacterController _characterController;

  CharacterListView(this._characterController);
}

class _CharacterListState extends BaseState<CharacterListView> {
  int _page = 1;
  final List<Character> _characters = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      state = BusyState();
    });
    _fetchCharacters(_page);
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (state.isBusy) {
      body = LoadingView();
    } else if (state.hasError) {
      body = ErrorView();
    } else {
      body = ListView.separated(
        controller: _scrollController
          ..addListener(() {
            if (_scrollController.offset == _scrollController.position.maxScrollExtent && !state.isBusy) {
              _fetchCharacters(_page);
              _page += 1;
            }
          }),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        separatorBuilder: (_, __) => SizedBox(height: 8),
        itemBuilder: (_, int index) {
          if (index == _characters.length) {
            return const LoadingWidgetMaker();
          }
          return CharacterCardView(character: _characters[index]);
        },
        itemCount: _characters.length + 1,
      );
    }
    return BaseScaffold(title: 'Characters', body: body);
  }

  void _fetchCharacters(int page) async {
    final resultState = await widget._characterController.getCharacters(page);
    setState(() {
      if (resultState is DataState) {
        _characters.addAll(resultState.data);
      } else if (resultState is EmptyState) {
        // TODO error state handler
      } else if (resultState is ErrorState) {
        // TODO error state handler
      }
      state = IdleState(hasError: resultState is ErrorState);
    });
  }
}
