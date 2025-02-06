# EXSquaredTestApp

EXSquaredTestApp is a cutting-edge iOS application developed in Swift, leveraging SwiftUI and Combine. It follows Clean Architecture principles and adheres strictly to SOLID principles to ensure modularity, scalability, and maintainability.

# 🐱 CatExplorer - iOS App  
A SwiftUI-based iOS app that fetches and displays a list of cats with details.

## 🚀 Features
- Infinite scrolling for cat list
- API integration for fetching cat details
- Image caching for better performance
- Clean architecture following SOLID principles
- Unit and UI tests for key components

## 📦 Tech Stack
- **SwiftUI** - UI Framework  
- **Combine** - Reactive programming  
- **CacheManager** - Custom image caching  
- **XCTest** - Unit & UI testing  

## Set up
#### Prerequisites
```bash
Xcode 16 or later
```
```bash
Swift 5.0 or later
```

#### Installation

Clone the repository:

```bash 
git clone [https://github.com/your-repo/EXSquaredTestApp.git](https://github.com/alexisgarciaaaaaa/EXSquaredTestApp.git)
cd EXSquaredTestApp
```
Copy the `Info.plist.example` file and rename it to `Info.plist`:
   ```bash
   cp Info.plist.example Info.plist

Open the project in Xcode:

```bash
open EXSquaredTestApp.xcworkspace
```
Configure environment variables:

```bash
Add your API_KEY, IMAGE_BASE_URL, and BASE_URL in EXSquaredTestApp/EXSquaredTestApp/SecureAPIKeys/Secrets.xcconfig.
```
Run the application on a simulator or physical device:

## Project Dependencies

#### Running Unit Tests

Open the project in Xcode.

In the menu bar, go to Product > Test or use the shortcut:

```bash
⌘ + U (Command + U)
```

To run a specific test, select the test file in Tests/ and press ⌘ + U.

#### Running UI Tests

For UI testing, use the --uitesting argument:

Navigate to Product > Scheme > Edit Scheme in Xcode.

Under the Arguments tab, add --uitesting.

Run UI tests:

```bash
⌘ + U (Command + U)
```

## Architectural Decisions

#### Clean Architecture

##### The project follows Clean Architecture, ensuring clear separation of concerns:

- UI Layer (Presentation): Handles UI using SwiftUI.

- Domain Layer (Business Logic): Contains use cases and repository interfaces.

- Data Layer (Data Management):

- ServiceLayer/: Handles API calls.

- Repository/: Defines abstraction for data access.

#### SOLID Principles

- S - Single Responsibility Principle: Each class has a single responsibility.
- O - Open/Closed Principle: Features can be extended without modifying existing code.
- L - Liskov Substitution Principle: Components can be swapped without breaking functionality.
- I - Interface Segregation Principle: Each protocol includes only necessary methods.
- D - Dependency Inversion Principle: High-level modules depend on abstractions, not implementations.

#### Additional Patterns Used

- Repository Pattern: Separates data access logic from business logic.
- Dependency Injection: ViewModels receive dependencies to improve testability and modularity.
- Singleton (Logger.swift, EnvManager.swift): Proper use of singletons for logging and configuration management.

#### Contact

For questions or suggestions, feel free to contribute or open an issue in the repository! 🎯🚀
