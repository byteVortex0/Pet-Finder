#🐾 Pet Finder

A Flutter project built to practice unit testing.
The focus of this project is writing testable, maintainable code using Bloc, Dio + Retrofit, and Hive, not on UI design.
---
## 🧱 Architecture Overview
This project follows a clean and modular architecture separating shared and feature-specific layers.

lib/
 ├── core/                  # Shared logic, services, utils, themes, constants
 └── features/
      ├── pets_home/
      │     ├── data/       # Models and repositories
      │     ├── logic/      # Bloc / Cubit
      │     └── ui/         # Presentation layer
      ├── favorite/
      │     ├── data/
      │     ├── logic/
      │     └── ui/
      └── ... (other features)

---
### ⚙️ Tech Stack

Flutter

Bloc – State management

Dio + Retrofit – Network layer

Hive – Local database

GetIt – Dependency injection

json_serializable – Code generation for models

Mockito – Unit testing

### 🧪 Testing Focus

The main purpose of this project is to practice testing in Flutter, covering:

Unit tests for repositories

Mocking external dependencies (API and Hive) using Mockito

Testing business logic and verifying expected calls

#FlutterMentors3
