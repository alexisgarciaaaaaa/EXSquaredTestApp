EXSquaredTestApp

📌 Overview

EXSquaredTestApp is a cutting-edge iOS application developed in Swift, leveraging SwiftUI and Combine. It follows Clean Architecture principles and adheres strictly to SOLID principles to ensure modularity, scalability, and maintainability.

🛠️ Setup Instructions

🔹 Prerequisites

Xcode 16 or later

Swift 5.0 or later

🔹 Installation

Clone the repository:

git clone https://github.com/your-repo/EXSquaredTestApp.git
cd EXSquaredTestApp

Open the project in Xcode:

open EXSquaredTestApp.xcworkspace

Configure environment variables:

Add your API_KEY, IMAGE_BASE_URL and BASE_URL in Secrets.xcconfig.

Run the application on a simulator or physical device:

⌘ + R (Command + R)

📦 Project Dependencies

SwiftUI: For declarative UI development.

Combine: For efficient asynchronous data handling.

🔍 Running Unit/UI Tests

🔹 Running Unit Tests

Open the project in Xcode.

In the menu bar, go to Product > Test or use the shortcut:

⌘ + U (Command + U)

To run a specific test, select the test file in Tests/ and press ⌘ + U.

🔹 Running UI Tests

For UI testing, use the --uitesting argument:

Navigate to Product > Scheme > Edit Scheme in Xcode.

Under the Arguments tab, add --uitesting.

Run UI tests:

⌘ + U (Command + U)

🏗️ Architectural Decisions

🔹 Clean Architecture

The project follows Clean Architecture, ensuring clear separation of concerns:

UI Layer (Presentation): Handles UI using SwiftUI.

Domain Layer (Business Logic): Contains use cases and repository interfaces.

Data Layer (Data Management):

ServiceLayer/: Handles API calls.

Repository/: Defines abstraction for data access.

🔹 SOLID Principles

✅ S - Single Responsibility Principle: Each class has a single responsibility.
✅ O - Open/Closed Principle: Features can be extended without modifying existing code.
✅ L - Liskov Substitution Principle: Components can be swapped without breaking functionality.
✅ I - Interface Segregation Principle: Each protocol includes only necessary methods.
✅ D - Dependency Inversion Principle: High-level modules depend on abstractions, not implementations.

🔹 Additional Patterns Used

✅ Repository Pattern: Separates data access logic from business logic.
✅ Dependency Injection: ViewModels receive dependencies to improve testability and modularity.
✅ Singleton (Logger.swift, EnvManager.swift): Proper use of singletons for logging and configuration management.

📌 Contact

For questions or suggestions, feel free to contribute or open an issue in the repository! 🎯🚀