import 'package:event_creator/features/auth/domain/entities/email_address.dart';
import 'package:event_creator/features/auth/domain/entities/login_data.dart';
import 'package:event_creator/features/auth/domain/entities/password.dart';
import 'package:event_creator/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:event_creator/features/auth/presentation/cubit/auth_state.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/route_manager.dart';
import 'package:event_creator/ui/resources/text_styles_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/toast.dart';
import 'package:event_creator/ui/widgets/default_elevated_button.dart';
import 'package:event_creator/ui/widgets/default_text_form_field.dart';
import 'package:event_creator/ui/widgets/password_text_form_field.dart';
import 'package:event_creator/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EmailPasswordLoginScreen extends StatefulWidget {
  const EmailPasswordLoginScreen();

  @override
  State<EmailPasswordLoginScreen> createState() =>
      _EmailPasswordLoginScreenState();
}

class _EmailPasswordLoginScreenState extends State<EmailPasswordLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  late TextTheme _textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _textTheme = Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(Insets.xl),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.eventCreator,
                style: _textTheme.displaySmall
                    ?.copyWith(fontWeight: FontWeightManager.bold),
              ),
              const SizedBox(height: Sizes.s4),
              Text(
                S.current.loginToYourAccount,
                style: _textTheme.titleMedium?.copyWith(
                  fontSize: FontSize.s18,
                  fontWeight: FontWeightManager.regular,
                ),
              ),
              const SizedBox(height: Sizes.s32),
              DefaultTextFormField(
                controller: _emailAddressController,
                hintText: S.current.emailAddress,
                keyboardType: TextInputType.emailAddress,
                prefixIconData: Icons.email_outlined,
                validator: validateEmailAddress,
              ),
              const SizedBox(height: Sizes.s12),
              PasswordTextFormField(controller: _passwordController),
              const SizedBox(height: Sizes.s24),
              Center(
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (_, state) {
                    _isLoading = state is AuthLoading;
                    if (state is AuthSuccess) {
                      context.go(Routes.home);
                    } else if (state is AuthError) {
                      showToast(state.message);
                    }
                  },
                  builder: (context, state) {
                    return DefaultElevatedButton(
                      label: S.current.login,
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          BlocProvider.of<AuthCubit>(context)
                              .loginWithEmailAndPassword(
                            LoginData(
                              emailAddress: EmailAddress(
                                _emailAddressController.text,
                              ),
                              password: Password(_passwordController.text),
                            ),
                          );
                        }
                      },
                      width: MediaQuery.of(context).size.width * 0.7,
                      isLoading: _isLoading,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.current.youAreNewHere),
                  TextButton(
                    onPressed: () =>
                        context.pushReplacementNamed(Routes.register),
                    child: Text(S.current.createAccount),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
