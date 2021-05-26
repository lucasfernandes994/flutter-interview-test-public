import 'package:flutter/material.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/presentation/base/base_scaffold.dart';
import 'package:flutter_interview_test/presentation/base/section_widget.dart';
import 'package:flutter_interview_test/presentation/base/status_widget.dart';

class CharacterDetailsView extends StatelessWidget {
  final Character character;

  CharacterDetailsView(this.character);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: character.name,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            if (character.imageUrl != null) ...[
              Image.network(
                character.imageUrl!,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
            ],
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  StatusWidget(status: character.status),
                  SizedBox(height: 16),
                  SectionWidget(
                    hint: 'Origin',
                    label: character.origin?.name,
                  ),
                  SizedBox(height: 16),
                  SectionWidget(
                    hint: 'Last known location',
                    label: character.location?.name,
                  ),
                  SizedBox(height: 16),
                  SectionWidget(hint: 'Gender', label: character.gender),
                  SizedBox(height: 16),
                  SectionWidget(hint: 'Species', label: character.species),
                  SizedBox(height: 16),
                  SectionWidget(hint: 'Type', label: character.type),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
