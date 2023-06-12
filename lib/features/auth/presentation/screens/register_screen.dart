import 'package:event_creator/features/auth/domain/entities/email_address.dart';
import 'package:event_creator/features/auth/domain/entities/gender.dart';
import 'package:event_creator/features/auth/domain/entities/password.dart';
import 'package:event_creator/features/auth/domain/entities/phone_number.dart';
import 'package:event_creator/features/auth/domain/entities/register_data.dart';
import 'package:event_creator/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:event_creator/features/auth/presentation/cubit/auth_state.dart';
import 'package:event_creator/features/auth/presentation/widgets/gender_radio_button_group.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _countryCode = '+20';
  Gender _selectedGender = Gender.male;
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
                S.current.welcome,
                style: _textTheme.displaySmall
                    ?.copyWith(fontWeight: FontWeightManager.bold),
              ),
              const SizedBox(height: Sizes.s4),
              Text(
                S.current.createNewAccount,
                style: _textTheme.titleMedium?.copyWith(
                  fontSize: FontSize.s18,
                  fontWeight: FontWeightManager.regular,
                ),
              ),
              const SizedBox(height: Sizes.s32),
              DefaultTextFormField(
                controller: _nameController,
                hintText: S.current.name,
                keyboardType: TextInputType.name,
                prefixIconData: Icons.person_outline_rounded,
                validator: (name) => validateRegularText(name, S.current.name),
              ),
              const SizedBox(height: Sizes.s12),
              DefaultTextFormField(
                controller: _emailAddressController,
                hintText: S.current.emailAddress,
                keyboardType: TextInputType.emailAddress,
                prefixIconData: Icons.email_outlined,
                validator: validateEmailAddress,
              ),
              const SizedBox(height: Sizes.s12),
              PasswordTextFormField(controller: _passwordController),
              const SizedBox(height: Sizes.s12),
              DefaultTextFormField(
                controller: _phoneNumberController,
                hintText: S.current.phoneNumber,
                keyboardType: TextInputType.phone,
                prefixIconData: Icons.phone_android_rounded,
                validator: validatePhoneNumber,
              ),
              const SizedBox(height: Sizes.s12),
              GenderRadioButtonGroup(
                onChanged: (newValue) => _selectedGender = newValue,
              ),
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
                      label: S.current.register,
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          BlocProvider.of<AuthCubit>(context)
                              .registerWithEmailAndPassword(
                            RegisterData(
                              name: _nameController.text,
                              emailAddress:
                                  EmailAddress(_emailAddressController.text),
                              password: Password(_passwordController.text),
                              phoneNumber: PhoneNumber(
                                countryCode: _countryCode,
                                number: _phoneNumberController.text,
                              ),
                              gender: _selectedGender,
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
                  Text(S.current.alreadyHaveAccount),
                  TextButton(
                    onPressed: () =>
                        context.pushReplacementNamed(Routes.emailPasswordLogin),
                    child: Text(S.current.login),
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
