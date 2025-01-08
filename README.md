
# Flutter Project: Rick and Morty Explorer

This project is a **Flutter** application designed to explore the universe of Rick and Morty. The app allows users to navigate characters, episodes, and locations with advanced features like search, an attractive design, and multilingual support.

---

## 📂 Project Structure

The project structure follows a modular and organized approach to facilitate scalability and maintenance.

````plaintext
.
├── README.md
├── analysis_options.yaml
├── assets
│   ├── fonts
│   ├── gif
│   ├── icons
│   ├── images
│   └── lang
├── lib
│   ├── app
│   ├── core
│   │   ├── constants
│   │   ├── error
│   │   ├── localization
│   │   ├── network
│   │   └── usecases
│   ├── features
│   │   ├── characters
│   │   ├── episodes
│   │   ├── home
│   │   ├── location
│   │   └── welcome
│   ├── main.dart
│   └── shared
│       ├── utils
│       └── widgets
├── pubspec.lock
├── pubspec.yaml
├── app-release.apk
````

---

## 🚀 Key Features

### **Character Exploration**
- List of characters with images, status, and more information.
- Advanced search by name, gender, and status.

### **Episode Exploration**
- List of episodes with codes and air dates.
- Name-based search filter.

### **Location Exploration**
- List of locations with details like dimension and type.
- Advanced search by name.

### **Interactive Design**
- Support for **light mode** and **dark mode**.
- Reusable components under the **Atomic Design** approach.

### **Multilingual Support**
- Available languages: English and Spanish.

---

## 🛠️ Technologies Used

### **Frontend**

- **Flutter 3.27.1**: Primary framework.
- **Riverpod**: State management.
- **GraphQL**: API connection to Rick and Morty.
- **Atomic Design**: Organization and component reuse.

### **Tools**

- **Dartz**: Error handling with `Either`.
- **Logger**: Event and error logging.
- **intl**: Multilingual support.

---

## 💾 Running the Project

### **Flutter Version**

This project is built using **Flutter 3.27.1**. It's recommended to use [FVM (Flutter Version Management)](https://fvm.app/) to ensure compatibility with the correct Flutter version.

#### **Steps to Set Up the Correct Flutter Version**

1. **Install FVM**:
   If you don't have FVM installed, run:
   ```bash
   dart pub global activate fvm
   ```

2. **Install Flutter 3.27.1 with FVM**:
   ```bash
   fvm install 3.27.1
   ```

3. **Run the Project with FVM**:
   ```bash
   fvm use 3.27.1
   fvm flutter pub get
   fvm flutter run
   ```

4. **For APK Testing**:
   Alongside the project files, you'll find the release APK:
   ```plaintext
   app-release.apk
   ```
   You can install it directly on an Android device to test the app.

---

## 🎨 Resources

### **Assets**

- **Fonts**:
  - `RickAndMorty.ttf`
  - `Stone Serif Semibold.ttf`
- **Images and GIFs**:
  - `loading.gif`: Animated loading indicator.
  - `logo.png`, `background_welcome.jpg`: Branding and welcome assets.
- **Languages**:
  - JSON files for `en` and `es`.

---

## 📋 Credits

This project was developed by **Mauricio Muñoz**, a developer with over 6 years of experience in mobile technologies, an expert in **Flutter**, and passionate about delivering high-quality solutions.

---

## 📜 License

This project is under the [MIT License](LICENSE).
