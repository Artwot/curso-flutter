import 'package:flutter/widgets.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    // Le indica al compilador que el parámetro assetName es requerido
    // @required especifica una propiedad que debe ser incluida
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                ),
              ),
              // Hack para centrar dos elementos con un widget con opacidad nula
              Opacity(
                opacity: 0.0,
                child: Image.asset('images/google-logo.png'),
              ),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
