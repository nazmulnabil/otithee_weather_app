# Flutter project (Android + iOS) App (Dart + Dio) - Weather App

A simple weather forecast App using Open Weather Map API based on Repository pattern.The presentation layer is separated from data layer to maintain the proper architecture so that the code can be easily testable,reusable and maintainable...
I have used `GetX` for state management. For network calls I used the popular Flutter package `Dio`.



### Project Description
https://github.com/nazmulnabil/otithee_weather_app/blob/main/screenshots/Screenshot_20220415-231319.png

A weather forecast Android Application with Flutter based on Repository pattern. The UI will be as like as above screenshot. There is a textfield which takes city name and a button.After pressing the button it takes input from textfield.Then App will send request to Open Weather web API and show the weather information in the UI.

### Open Weather API
We will use [Open Weather Map API](https://openweathermap.org/api) for collecting weather information. To get the real weather information of a city, you need to sign up and get your own `APP ID`. Otherwise you can test the API with their sample `BASE URL` and sample `APP ID` without creating account.

### Project Setup
Clone the project and open it using Android Studio. Then create a file `config.json` inside `assets` folder. Add `baseUrl` and `appId` JSON field inside the parent JSON object.


#### Use Sample API without creating account
Add below lines at your `config.json` file. Then run the project. You'll get dummy or static API response from Open Weather API.
```
{
  "baseUrl": "https://samples.openweathermap.org/data/2.5",
  "appId": "b6907d289e10d714a6e88b30761fae22"
}
```
#### Use Real APP ID after sign up and activation of your APP ID
After Sign up at the website collect your own `APP ID` from their [API Keys page](https://home.openweathermap.org/api_keys). Then add your `APP ID` in `config.json` file like below.
```
{
  "baseUrl": "http://api.openweathermap.org/data/2.5",
  "appId": "<YOUR OWN APP ID>"
}
```
The BASE URL and APP ID will be fetched from `main.dart` file and will be stored it in our local configuration file.

**Note:** The free version of Open Weather API allows maximum 60 API calls per minute.
### Run the project
Run `flutter pub get` to sync the packages. Then run the app to your real device or emulator.

### Here Getx is used for state management...
bindings used for dpendency injection..Controllers are injeceted lazily so that it is attached to views only when needed and detached when no longer in use... 
Obx() used for reactive state management...No stateful widget used.


