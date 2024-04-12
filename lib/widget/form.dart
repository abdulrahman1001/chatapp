import 'package:chatapp/cubit/cubit/auth_cubit.dart';
import 'package:chatapp/widget/checkacunt.dart';
import 'package:chatapp/widget/loding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormAuth extends StatelessWidget {
  FormAuth({
    Key? key,
    required this.namepage,
    required this.secpage,
  }) : super(key: key);

  final String namepage;
  final String secpage;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
   
    return BlocProvider(
      create: (context) => registerlogincubit(),
      child: BlocConsumer<registerlogincubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
          } else if (state is AuthSuccess) {

            Navigator.pushNamed(context, '/c',arguments: email);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return LoadingOverlay(
            isLoading: state is AuthLoading,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (!value.contains('@') ||
                          !value.contains('.com')) {
                        return 'Please enter a valid email';
                      }
                      return null; // Add return null for valid input
                    },
                    decoration: InputDecoration(
                      hintText: 'email',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 8) {
                        return 'Please enter 8 characters or more';
                      } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                        // Correct RegExp usage
                        return 'Password should contain numbers'; // Corrected message
                      }
                      return null; // Add return null for valid input
                    },
                    decoration: InputDecoration(
                      hintText: 'password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await BlocProvider.of<registerlogincubit>(context)
                              .login(email, password, namepage);
                        }
                      },
                      child: Text(namepage),
                    ),
                  ),
                  checkacount(
                    checlsentence: 'Do you already have an account?',
                    textbutton: secpage,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
