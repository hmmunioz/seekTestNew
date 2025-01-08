
# Flutter Project: Rick and Morty Explorer

This project is a **Flutter** application designed to explore the universe of Rick and Morty. The app allows users to navigate characters, episodes, and locations with advanced features like search, an attractive design, and multilingual support.

---

## 📂 Project Structure

The project structure follows a modular and organized approach to facilitate scalability and maintenance.

```plaintext
.
├── README.md
├── analysis_options.yaml
├── assets
│   ├── fonts
│   ├── gif
│   ├── icons
│   ├── images
│   └── lang
├── lib
│   ├── app
│   ├── core
│   │   ├── constants
│   │   ├── error
│   │   ├── localization
│   │   ├── network
│   │   └── usecases
│   ├── features
│   │   ├── characters
│   │   ├── episodes
│   │   ├── home
│   │   ├── location
│   │   └── welcome
│   ├── main.dart
│   └── shared
│       ├── utils
│       └── widgets
├── pubspec.lock
├── pubspec.yaml
```

---

## 🚀 Key Features

- **Character Exploration**:
  - List of characters with images, status, and more information.
  - Advanced search by name, gender, and status.
- **Episode Exploration**:
  - List of episodes with codes and air dates.
  - Name-based search filter.
- **Location Exploration**:
  - List of locations with details like dimension and type.
  - Advanced search by name.
- **Interactive Design**:
  - Support for **light mode** and **dark mode**.
  - Reusable components under the **Atomic Design** approach.
- **Multilingual Support**:
  - Available languages: English and Spanish.

---

## 🛠️ Technologies Used

### **Frontend**
- **Flutter 3.27.1**: Primary framework.
- **Riverpod**: State management.
- **GraphQL**: API connection to Rick and Morty.
- **Atomic Design**: Organization and component reuse.

### **Tools**
- **Mockito**: Unit testing.
- **Dartz**: Error handling with `Either`.
- **Logger**: Event and error logging.
- **intl**: Multilingual support.

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

## 📂 Main Modules

### **1. App**
Main application configuration:
- **Language**: `app_language_provider.dart`.
- **Theme**: `app_theme_provider.dart`.
- **Routes**: Navigation between pages.

### **2. Core**
Reusable and essential elements:
- **Constants**: `app_colors`, `app_assets`, `app_strings`.
- **Error Handling**: `error_handler`, `failures`.
- **Network**: GraphQL configuration and client.
- **Use Cases**: Base structure for logic.

### **3. Features**
Each primary functionality:
- **Characters**:
  - Presentation: List, search.
  - Data: Datasource and repository.
  - Domain: Use cases and entities.
- **Episodes**:
  - Similar to Characters but focused on episodes.
- **Locations**:
  - Similar to Characters but focused on locations.
- **Welcome**:
  - Welcome screen.

### **4. Shared**
Shared components and utilities:
- **Utils**: Helper functions like `screen_utils`.
- **Widgets**:
  - `atoms`, `molecules`, `organisms`, `templates`.

---

## 🧪 Testing

The project includes unit tests for each module:

- **Datasource**: Verifies data is fetched correctly from the API.
- **Repository**: Ensures data conversion to the domain layer.
- **Notifier**: Validates state handling and interactions.

Run the tests with:
```bash
flutter test
```

---

## 📋 Credits

This project was developed by **Mauricio Muñoz**, a developer with over 6 years of experience in mobile technologies, an expert in **Flutter**, and passionate about delivering high-quality solutions.

---

## 🔮 Future Steps

1. **Improve the Interface**:
   - Add smooth transitions and micro-interactions.
2. **Offline Support**:
   - Local persistence with SQLite or Hive.
3. **New Features**:
   - Favorites for characters, episodes, and locations.

---

## 💻 Requirements

### **Dependencies**
Install dependencies with:
```bash
flutter pub get
```

### **Run**
Start the app with:
```bash
flutter run
```

---

## 📜 License

This project is under the [MIT License](LICENSE).
