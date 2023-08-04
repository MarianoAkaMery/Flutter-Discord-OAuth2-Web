```markdown
# Flutter-Discord-OAuth2-Web
```
# Flutter Discord OAuth2 Demo 🚀

This Flutter application demonstrates how to implement Discord OAuth2 authentication and fetch user information using FlutterWebAuth and HTTP requests.

## Getting Started 🛠️

### Prerequisites 📋

- Flutter: Make sure you have Flutter installed. If not, you can download it from [here](https://flutter.dev/docs/get-started/install).

### Installation 💻

1. Clone the repository:

   ```
   git clone https://github.com/MarianoAkaMery/Flutter-Discord-OAuth2-Web.git
   ```

2. Navigate to the project directory:

   ```
   cd your-repo
   ```

3. Install dependencies:

   ```
   flutter pub get
   ```

### Configuration ⚙️

1. Replace the placeholders in the `lib/main.dart` file with your Discord OAuth2 credentials:
   - Replace `YOUR_CLIENT_ID` with your Discord application's Client ID.
   - Replace `YOUR_CLIENT_SECRET` with your Discord application's Client Secret.
   - Replace `YOUR_REDIRECT_URI` with your OAuth2 Redirect URI.

2. If you are testing locally, set `redirectUri` to `'http://localhost:8080/auth.html'` in the `_loginWithDiscord` function.

3. Create a file named `auth.html` in the `web` folder of your project and add the following code to it:

   ```html
   <!DOCTYPE html>
    <html>
    <head>
   <title>Authentication complete</title>
    </head>
    <body>
    <p>Authentication is complete. If this does not happen automatically, please close the window.</p>
    <script>
    window.opener.postMessage({
      'flutter-web-auth': window.location.href
    }, window.location.origin);
    window.close();
    </script>
    </body>
    </html>
 
   ```

### Usage 🚀

1. Run the application:

   ```
   flutter run
   ```

2. Click the "Login With Discord OAuth2" button to initiate the authentication process.

3. Once authenticated, the app will fetch user information including email and identity.

## Notes 📝

- The `flutter_web_auth` package is used for handling web authentication.
- The `http` package is used for making HTTP requests.
- After successful authentication, this demo fetches the user's information using Discord's API.

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```

Make sure to replace `<!-- Paste your auth.html code here -->` with the actual HTML code you want users to include in their `auth.html` file. This will provide users with clear instructions on what needs to be done to make the application work correctly.
