import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart'; // Import for handling web authentication
import 'dart:convert' show jsonDecode; // Import for JSON decoding
import 'package:http/http.dart' as http; // Import for making HTTP requests

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Discord OAuth2',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(
          title:
              'Flutter Demo Discord OAuth2'), // Set the home page to MyHomePage widget
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userinfo = ''; // Variable to store user information

  Future<void> _loginWithDiscord() async {
    // Discord OAuth2 credentials (You should fill these with your own values)
    const discordClientID = 'YOUR_CLIENT_ID';
    const discordClientSecret = 'YOUR_CLIENT_SECRET';
    const redirectUri = 'YOUR_REDIRECT_URI';
    //Use: redirectUri = 'http://localhost:8080/auth.html'; if you are testing

    // Construct the authorization URL
    Uri authUrl = Uri.https('discord.com', '/oauth2/authorize', {
      'response_type': 'code',
      'client_id': discordClientID,
      'redirect_uri': redirectUri,
      'scope': 'email identify',
    });

    // Authenticate with Discord using FlutterWebAuth
    final authResult = await FlutterWebAuth.authenticate(
      url: authUrl.toString(),
      callbackUrlScheme:
          'index.html', // Callback URL scheme used for handling the authentication result
    );

    final authCode = Uri.parse(authResult)
        .queryParameters['code']; // Extract the authorization code

    // Request access token from Discord
    Uri tokenUrl = Uri.https('discord.com', '/api/oauth2/token');
    final tokenResponse = await http.post(tokenUrl, body: {
      'client_id': discordClientID,
      'client_secret': discordClientSecret,
      'redirect_uri': redirectUri,
      'grant_type': 'authorization_code',
      'code': authCode,
    }, headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    final accessToken = jsonDecode(
        tokenResponse.body)['access_token']; // Extract the access token

    // Fetch user information using the obtained access token
    Uri userUrl = Uri.https('discord.com', '/api/v9/users/@me');
    final userResponse = await http.get(userUrl, headers: {
      'Authorization':
          'Bearer $accessToken', // Attach the access token to the request headers
    });

    setState(() {
      userinfo = userResponse.body; // Update the user information in the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('User Information:'),
            const SizedBox(height: 50),
            Text('${userinfo}'), // Display the fetched user information
            ElevatedButton(
              onPressed:
                  _loginWithDiscord, // Call the Discord authentication function
              child: const Text('Login With Discord OAuth2'),
            )
          ],
        ),
      ),
    );
  }
}
