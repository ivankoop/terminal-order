import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class User {
    String email;
    String password;
}

User user = new User();

main(List<String> arguments) {
    print("Welcome to Terminal BK 🍔 🍟");
    checkLoginOrRegister();
}

void checkLoginOrRegister() {

    print("Ingrese (1) si desea iniciar sesión");
    print("Ingrese (2) si desea registrarse");
    var line = stdin.readLineSync(encoding: UTF8);

    if(line.trim() == "1") {
        onLogin();
    } else if(line.trim() == "2") {
        print("se va a registrar");
    } else {
        checkLoginOrRegister();
    }

}

void onLogin() {

    if(user.email == null || user.email == "") {
        print("Ingrese su dirección de email:");
        var email = stdin.readLineSync(encoding: UTF8);

        if(!checkEmail(email)) {
            print("Debe ingresar un email válido");
            onLogin();
            return;
        }

        user.email = email;
    }

    print("Ingrese su password:");
    var password = stdin.readLineSync(encoding: UTF8);

    if(password == "") {
        onLogin();
        return;
    }

    user.password = password;

    print("Email: " + user.email);
    print("Password: " + user.password);
}

bool checkEmail(String email) {

    RegExp exp = new RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    bool emailValid = exp.hasMatch(email);

    return emailValid;
}
