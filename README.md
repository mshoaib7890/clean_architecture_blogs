# 📝 Blogs App – Clean Architecture with Flutter BLoC

This is a simple yet powerful **Blogs App** built using **Flutter** and **BLoC pattern**, following the principles of **Clean Architecture**. The app allows users to read and manage blogs with a clean separation of concerns across different layers.

---

## 📱 Features

- 📄 View list of blogs
- 🔍 View full blog details
- ➕ Add new blog (optional)
- ✏️ Edit and delete existing blogs (optional)
- 🔄 Pull-to-refresh
- ⚡ Responsive and smooth UI with BLoC state management

---

## 🧠 Architecture

This app uses **Clean Architecture** with a layered approach:

```
lib/
│
├── core/               # Core utilities, constants, error handling
├── features/
│   └── blog/
│       ├── data/       # Repositories, API services, models (DTO)
│       ├── domain/     # Entities, repositories abstract, use cases
│       └── presentation/
│           ├── bloc/   # BLoC and event/state management
│           └── pages/  # UI screens
├── main.dart           # Entry point
```

---

## 🔧 Tech Stack

- Flutter 🧡
- BLoC (flutter_bloc package)
- Clean Architecture 🏛️
- Dartz for functional programming style (optional)
- Equatable for value comparison
- HTTP or Dio (for APIs)
- Responsive UI design

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/blogs_app.git
   ```
2. Move into the project directory:
   ```bash
   cd blogs_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## 📸 Screenshots

(Add app screenshots here to showcase UI)

---

## 🙌 Credits

Developed by **Shoaib**  
Using Flutter + Clean Architecture + BLoC 💙

---

## 📃 License

This project is licensed under the MIT License.

