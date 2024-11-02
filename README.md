# 🚀 Miles - A Flutter Project

Welcome to Miles 🌟,

## 📁 Project Structure

Miles is organized into several key directories, each serving a specific function in the application architecture:

- **🔑 core**: Contains the essential models and business logic.
  - `models`: Definitions of data models like `HomeScreenModel` and `TestimonialsModel`.
  - `routes`: Routing configurations for navigation.
- **💾 data**: Handles data management and state.
  - `repositories`: Abstractions for data fetching and handling.
  - `services`: Services like API integration and data manipulation.
- **🌟 features**: The main functionalities split into specific domains.
  - `home`: Views and widgets specific to the home screen, like `HomeScreen`, `EventsCard`, etc.
  - `talk_to_us`: Contains UI and logic for user feedback.
- **🛠 utils**: Utilities and helper functions.
- **🧩 widgets**: Reusable UI components across the app like `CustomNavbar`, `CircularProfileAvatar`, etc.

Each directory is structured to support a clean and modular architecture, promoting maintainability and scalability.

## 🌈 Features

- **🔄 Dynamic Data Integration**: Utilizes mocked JSON data to simulate real API responses.
- **🎥 YouTube Video Integration**: Embeds YouTube videos seamlessly within the app.
- **🎨 Interactive UI Components**: Includes carousels, cards, and custom animations that enhance the user interface.
- **🖼 3D Gallery View**: Provides a 3D view of images and videos, elevating the visual experience.
- **🔁 Pull-to-Refresh**: Refreshes data on user interaction, ensuring the content is up-to-date.
- **💬 Customizable User Feedback**: Features a 'Talk to Us' bottom sheet for user interactions and feedback.

## 📦 Dependencies

Miles uses several external packages, crucial for its features:

- `provider` for state management.
- `youtube_player_flutter` for embedding YouTube videos.
- `sizer` for responsive layouts.
- `flutter_svg`, `cached_network_image` for image handling.
- Other dependencies as listed in `pubspec.yaml`.

## 📬 Contact

For more information, contact [priyanshubej2001@gmail.com](mailto:priyanshubej2001@gmail.com).
