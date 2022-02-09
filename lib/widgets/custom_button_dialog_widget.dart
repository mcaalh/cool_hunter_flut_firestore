import 'package:CoolHunter/theme/main_theme.dart';
import 'package:flutter/material.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 7),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: kSecondaryLabelColor,
              width: 2,
            ),
          ),
        ),
        child: const Text(
          'test',
          style: kLink,
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          height: 370.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
                child: Column(
                  children: const <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'AppLocalizations.of(context)!.letUsTake',
                      style: kTitleCategory,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'AppLocalizations.of(context)!.continueYourJourney',
                      style: kLabelSidebar,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                    child: const Text('AppLocalizations.of(context)!.explore'),
                    style: TextButton.styleFrom(
                      backgroundColor: kStandardButtonColor,
                      padding: const EdgeInsets.all(15.0),
                      primary: kStandardLabelColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, 'Continuer');
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: TextButton(
                  child: const Text(
                    'AppLocalizations.of(context)!.cancel',
                    style: kLink,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: kBackgroundColor,
                    primary: kStandardLabelColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
