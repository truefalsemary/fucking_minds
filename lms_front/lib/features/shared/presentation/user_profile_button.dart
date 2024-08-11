import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileButton extends StatelessWidget {
  const UserProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: SvgPicture.asset('assets/icons/account_circle.svg'),
    );
  }
}
