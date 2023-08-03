# aamar_task - README

This project is a Flutter application that fetches a list of posts from the JSONPlaceholder API and
displays them in a user-friendly manner. It includes features such as fetching data, displaying
posts, search functionality, and navigating to post details.

## Getting Started

To run the app locally, follow these steps:

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)

### Installation

1. Clone the repository:

```bash
   git clone https://github.com/HazemElgohary/aamar_task_bloc.git
   ```

2. Open it in Android Studio
3. Install dependencies:

```bash
flutter pub get
```

4. Connect a device or start an emulator.
5. Run the app:

```bash
flutter run
```

Decisions Made During Development During the development of this project, the following decisions
were made:

1. State Management: The BLoC (Business Logic Component) pattern was chosen for state management. It
   provides a clear separation of concerns and allows for better code organization.
2. API Integration: The JSONPlaceholder API was used to fetch the list of posts. It provides a
   simple and easy-to-use API for testing purposes.
3. Search Functionality: A local search feature was implemented to filter the displayed posts by
   title. This allows users to easily find specific posts.
4. UI/UX Design: The design of the app follows a clean and user-friendly approach. Loading, error,
   and empty state displays were implemented to provide a smooth user experience.

