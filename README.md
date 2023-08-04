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
   flutter run -d chrome --web-port 8080
   ```

2. Click the "Login With Discord OAuth2" button to initiate the authentication process.

3. Once authenticated, the app will fetch user information including email and identity.

## Notes 📝

- The `flutter_web_auth` package is used for handling web authentication.
- The `http` package is used for making HTTP requests.
- After successful authentication, this demo fetches the user's information using Discord's API.
  
 - Setting Up a Discord Application for OAuth2
   OAuth2 is a secure authorization framework that allows applications to access user data without exposing sensitive information. Setting up a Discord application for OAuth2 involves creating an application on the Discord Developer Portal and configuring the necessary settings to enable OAuth2 authentication.
   
   Prerequisites
   Discord Account: You need a Discord account to access the Discord Developer Portal.
   
   Basic Programming Knowledge: You should have a basic understanding of programming concepts and web development.
   
   Steps to Set Up a Discord Application for OAuth2
   Follow these steps to set up a Discord application for OAuth2:
   
   Create a New Application:
   
   Go to the Discord Developer Portal.
   Log in with your Discord account if you're not already logged in.
   Click on the "New Application" button.
   Enter a name for your application and click "Create".
   Configure OAuth2 Redirects:
   
   In the left sidebar, select "OAuth2".
   In the "Redirects" section, click "Add Redirect".
   Enter the redirect URL where Discord will send the user after authentication. This URL should be handled by your application to complete the OAuth2 flow.
   Get Client ID and Client Secret:
   
   In the "General Information" section, you will find your "Client ID" and "Client Secret". Keep these values secure, as they are used for authenticating your application with Discord's OAuth2 API.
   Select OAuth2 Scopes:
   
   Under the "OAuth2" section, you'll see a list of OAuth2 scopes. These scopes determine the level of access your application will have. Select the scopes you need based on your application's functionality. Common scopes include:
   identify: Access to the user's identity information.
   guilds: Access to the user's guilds (servers).
   messages.read: Access to read messages in the user's DMs.
   Generate OAuth2 URL:
   
   In the "OAuth2" section, you'll see a "OAuth2 URL Generator". Select the scopes you added and copy the generated OAuth2 URL.
   Implement OAuth2 Flow:
   
   In your application, implement the OAuth2 flow using the OAuth2 URL you generated. Guide users through the authorization process:
   Redirect them to the generated OAuth2 URL.
   Users will be prompted to authorize your application's access to their data.
   After authorization, Discord will redirect users back to the URL you specified, along with an authorization code.
   Use the authorization code to exchange for an access token and refresh token by making a POST request to https://discord.com/api/oauth2/token.
   Handle Data:
   
   Once you have the access token, you can use it to make authorized API requests to Discord on behalf of the user. Be sure to handle the data securely and respect user privacy.
   Refresh Tokens:
   
   Access tokens have a limited lifespan. To maintain access, use the refresh token to request a new access token without requiring user reauthorization.
   Remember to thoroughly review the Discord API documentation for detailed information on endpoints, authentication, and data usage.
   
   By following these steps, you can set up a Discord application for OAuth2 and enable secure and authorized access to user data.
   ## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
