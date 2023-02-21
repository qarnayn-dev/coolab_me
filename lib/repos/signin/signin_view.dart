import 'package:coolab_me/common_widgets/cta_button.dart';
import 'package:coolab_me/common_widgets/line_with_text_seperator.dart';
import 'package:coolab_me/common_widgets/onboard_frame.dart';
import 'package:coolab_me/common_widgets/textfield_with_title.dart';
import 'package:coolab_me/configs/app_theme.dart';
import 'package:coolab_me/routing/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common_widgets/signup_with_other_button.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardFrame(
      child: Column(
        children: [
          const SizedBox(
            height: 52,
            child: Text(
              "Welcome",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextfieldWithTitle(
                    onChange: (value) {
                      //  TODO: handle
                    },
                    title: "email",
                    // iconData: Icons.alternate_email,
                  ),
                  const SizedBox(height: 16),
                  TextfieldWithTitle(
                    onChange: (value) {
                      //  TODO: handle
                    },
                    title: "password",
                    // iconData: Icons.lock,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 16,
                    width: double.maxFinite,
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        // TODO: go to forgot pw page
                      },
                      child: Text(
                        "forgot password?",
                        style: AppTheme.captionStyleLight.copyWith(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CtaButton(
                          onClick: () {
                            // TODO: login
                          },
                          text: "Login",
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CtaButton(
                          onClick: () {
                            // TODO: signup page
                            GoRouter.of(context).push(RouteNames.signup);
                          },
                          text: "Signup",
                          forSecondary: true,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          const SizedBox(
            height: 56,
            child: LineWithTextSeparator(text: "or"),
          ),
          // google signin
          SignupWithOtherButton(
            onPressed: () {
              // TODO: Nav to the page
            },
            text: "sign in with google",
            logo: const Icon(
              Icons.g_mobiledata,
              color: AppTheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
