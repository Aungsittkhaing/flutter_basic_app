import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({super.key});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final GlobalKey<FormFieldState<String>> _passwordKey = GlobalKey<FormFieldState<String>>();

  //nullable
  String? _name;
  String? _phoneNumber;
  String? _email;
  String? _password;

  //validator method
  String? _validateName(String? value){
    if(value?.isEmpty ?? false){
      return 'Name is required.';
    }
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if(!nameExp.hasMatch(value!)){
      return 'Please enter only alphabetical characters';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0,),
            //name form
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),
              onSaved: (String? value){
                _name = value;
                print('name=$_name');
              },
              validator: _validateName,
            ),
            const SizedBox(height: 24.0,),
            //for phone
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.phone),
                hintText: 'Where can we reach you?',
                labelText: 'Phone Number *',
                prefixText: '+95',
              ),
              keyboardType: TextInputType.phone,
              onSaved: (String? value){
                _phoneNumber = value;
                print('phoneNumber = $_phoneNumber');
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),

            //for email
            const SizedBox(height: 24.0),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.email),
                hintText: 'enter your email address',
                labelText: 'Email *'
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value){
                _email = value;
                print('Email = $_email');
              },
            ),
            const SizedBox(height: 24.0),
            //short story
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tell us about yourself',
                helperText: 'Keep it short demo',
                labelText: 'Short Story'
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24.0),
            //for salary
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Salary',
                prefixText: '\$',
                suffixText: 'USD',
                suffixStyle: TextStyle(color: Colors.green)
              ),
            ),
            const SizedBox(height: 24.0,),
            //for password
           PasswordField(
             fieldKey: _passwordKey,
             helperText: 'No More than 8 characters',
             labelText: 'Password *',
             onFieldSubmitted: (String value){
               setState(() {
                 _password = value;
               });
             },
           ),
            //retype password
            const SizedBox(height: 24.0,),
            TextFormField(
              enabled: _password != null && _password!.isNotEmpty,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                labelText: 'Retype password'
              ),
              maxLength: 8,
              obscureText: true,
            )
          ],
        ),
      ),
    );
  }
}
class PasswordField extends StatefulWidget {
  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted
});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: (){
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        )
      ),
    );
  }
}

