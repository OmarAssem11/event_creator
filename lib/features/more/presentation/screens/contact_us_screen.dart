import 'package:event_creator/features/auth/domain/entities/email_address.dart';
import 'package:event_creator/features/more/domain/entities/contact_us_data.dart';
import 'package:event_creator/features/more/presentation/cubit/more_cubit.dart';
import 'package:event_creator/features/more/presentation/cubit/more_state.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/toast.dart';
import 'package:event_creator/ui/widgets/default_elevated_button.dart';
import 'package:event_creator/ui/widgets/default_text_form_field.dart';
import 'package:event_creator/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen();

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.contactUs),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(Insets.xl),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DefaultTextFormField(
                controller: _nameController,
                hintText: S.current.name,
                validator: (name) => validateRegularText(name, S.current.name),
              ),
              const SizedBox(height: Sizes.s12),
              DefaultTextFormField(
                controller: _emailAddressController,
                hintText: S.current.emailAddress,
                validator: validateEmailAddress,
              ),
              const SizedBox(height: Sizes.s12),
              DefaultTextFormField(
                controller: _subjectController,
                hintText: S.current.subject,
                validator: (subject) =>
                    validateRegularText(subject, S.current.subject),
              ),
              const SizedBox(height: Sizes.s12),
              DefaultTextFormField(
                controller: _messageController,
                hintText: S.current.message,
                validator: (message) =>
                    validateRegularText(message, S.current.message),
                maxLines: 5,
              ),
              const SizedBox(height: Sizes.s32),
              BlocConsumer<MoreCubit, MoreState>(
                listener: (_, state) {
                  _isLoading = state is MoreLoading;
                  if (state is ContactUsSuccess) {
                    showToast(S.current.sent);
                    context.pop();
                  }
                },
                builder: (context, state) {
                  return DefaultElevatedButton(
                    label: S.current.submit,
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        BlocProvider.of<MoreCubit>(context).contactUs(
                          ContactUsData(
                            name: _nameController.text,
                            emailAddress:
                                EmailAddress(_emailAddressController.text),
                            subject: _subjectController.text,
                            message: _messageController.text,
                          ),
                        );
                      }
                    },
                    isLoading: _isLoading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailAddressController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
