# Zenly - Immersive Ambience & Journaling App

Zenly is a Flutter-based application designed to provide users with a sanctuary of atmospheric sounds and a private space for mindful reflection. It follows a linear, immersion-first flow: Explore → Experience → Reflect.

## How to Run the Project

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd ambience_app
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run build_runner** (to generate Hive adapters):
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
4.  **Run the app**:
    ```bash
    flutter run
    ```

---

## Architecture Explanation

The project is built using **Clean Architecture** principles, ensuring a strict separation of concerns, testability, and maintainability.

## Folder Structure
The app is organized into features, each containing its own layers:

- `lib/app/`: Core app configuration, global router, and entry point.
- `lib/features/`: Contains feature-specific logic.
    - `journal/`: The journaling feature.
        - `domain/`: Business logic (Entities, Repository Interfaces, Use Cases).
        - `data/`: Implementation details (Models, Data Sources, Repository Implementations).
        - `presentation/`: UI components (Screens, Widgets, BLoCs).
    - `ambience/`: Discovery and selection of atmospheric sounds.
    - `player/`: Audio playback and breathing visuals.
- `lib/shared/`: Shared themes, colors, and global constants.

## State Management Approach
- **BLoC (Business Logic Component)**: Used for the Journal feature to manage complex states (Loading, Loaded, Saved, Error). This ensures that the UI remains a pure reflection of the state.
- **Provider (ChangeNotifier)**: Used for the `AudioController` to provide global, reactive access to audio playback states (position, duration, playing status) across the entire app.

## Data Flow (Repository → Controller → UI)
1.  **Repository**: The `JournalRepositoryImpl` fetches data from the `Hive` local database and converts `JournalModel` (data) into `JournalEntity` (domain).
2.  **Use Case**: The BLoC invokes a Use Case (e.g., `GetJournals`), which interacts with the Repository interface.
3.  **Controller (BLoC)**: The `JournalBloc` receives events, calls the use case, and emits a new `JournalState`.
4.  **UI**: The screen uses a `BlocBuilder` to listen for state changes and rebuilds the interface with dynamic data.

---

## Packages Used

- **flutter_bloc**: Chosen for its robust state management and strict event-to-state mapping, perfect for the journaling flow.
- **just_audio**: A high-performance audio plugin used to handle seamless asset-based playback and real-time streams.
- **hive & hive_flutter**: Selected for local persistence. Hive is a lightweight and blazing-fast NoSQL database, ideal for storing journal entries.
- **provider**: Used for simple global state (Audio Controller) where a full BLoC was not necessary.
- **equatable**: Simplifies object comparison in BLoCs and Entities, preventing unnecessary UI rebuilds.
- **uuid**: Generates unique identifiers for every journal entry.
- **google_fonts**: Provides a consistent, premium typographic experience.

---

## Tradeoffs & Future Improvements

### Current Tradeoffs
- **Local Only**: Currently, data is stored only in Hive. While fast and private, there is no cloud synchronization.
- **Simplified Audio Controller**: The `AudioController` is a single instance. In a larger app with multiple audio sources, a more complex service-based approach would be used.

### What I would improve with 2 more days:
1.  **Unit & Integration Tests**: Implement a comprehensive test suite for the BLoC and Repository layers to ensure 100% reliability.
2.  **Advanced Audio Features**: Add cross-fade effects between different ambiences and background audio execution support using `audio_service`.
3.  **Rich Text Journaling**: Enhance the reflection input to support basic formatting (bold, bullet points) and perhaps photo attachments.
4.  **Onboarding Experience**: Create a gentle, immersive onboarding flow to introduce users to the "Zenly" philosophy.
5.  **Analytics & Insights**: Implement local data visualization to show users their most common "resonances" (moods) over time.
