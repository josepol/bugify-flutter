import 'package:bugify/auth.provider.dart';
import 'package:bugify/config/constants.dart';
import 'package:bugify/config/theme.dart';
import 'package:bugify/screens/login/login.provider.dart';
import 'package:bugify/screens/login/models/login.model.dart';
import 'package:bugify/screens/login/models/token.model.dart';
import 'package:bugify/screens/login/widgets/LoginTextField.widget.dart';
import 'package:bugify/widgets/button.widget.dart';
import 'package:bugify/widgets/error.dialog.widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginProvider loginProvider = LoginProvider();
  AuthProvider autProvider = AuthProvider();

  bool isLoginButtonEnabled;
  String username;
  String password;

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _usernameTextChanged(String usernameValue) {
    this.setState(() {
      this.username = usernameValue;
    });
    this.validateLoginButtonEnable();
  }

  void _passwordTextChanged(String passwordValue) {
    this.setState(() {
      this.password = passwordValue;
    });
    this.validateLoginButtonEnable();
  }

  void validateLoginButtonEnable() {
    this.isLoginButtonEnabled =
        this.username.length > 0 && this.password.length > 0;
  }

  void _loginButtonPressed() {
    LoginModel loginModel = LoginModel(this.username, this.password);
    this.loginProvider.login(loginModel).then((response) {
      TokenModel tokenModel = TokenModel.fromJSON(response.data);
      this.getSharedPreferences(tokenModel);
      this.autProvider.setToken(tokenModel.token);
      Navigator.pushReplacementNamed(context, Constants.HOME_ROUTE);
    }).catchError((error) {
      this._showErrorDialog();
    });
  }

  void getSharedPreferences(TokenModel tokenModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(Constants.TOKEN_REF, tokenModel.token);
  }

  void _showErrorDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialogWidget();
        });
  }

  List<Widget> _loginTexFields() {
    return [
      Text('BUGIFY',
          style: Theme.of(context).textTheme.title.copyWith(fontSize: 120)),
      LoginTextFieldButton(
          hintText: 'Username',
          isPassword: false,
          textOnChangeCallback: this._usernameTextChanged,
          autofocus: false),
      LoginTextFieldButton(
          hintText: 'Password',
          isPassword: true,
          textOnChangeCallback: this._passwordTextChanged),
    ];
  }

  List<Widget> _loginButtons() {
    return [
      ButtonWidget(
        onPressCallback: this._loginButtonPressed,
        isButtonEnabled: this.isLoginButtonEnabled,
        buttonText: 'LOGIN',
      ),
      Text('or', style: Theme.of(context).textTheme.body2),
      ButtonWidget(
        onPressCallback: this._loginButtonPressed,
        isButtonEnabled: true,
        buttonText: 'SIGN IN WITH GOOGLE',
        leftImage: 'images/google.png',
      )
    ];
  }

  Widget landscape() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: this._loginTexFields(),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: this._loginButtons(),
          ),
        )
      ],
    );
  }

  Widget portrait() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.from(this._loginTexFields())
          ..addAll(this._loginButtons()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: ThemeConfig.backgroundGradientStops,
            colors: ThemeConfig.backgroundGradientColor,
          )),
          child: SafeArea(
            child: OrientationBuilder(builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? this.portrait()
                  : this.landscape();
            }),
          )),
    ));
  }
}
