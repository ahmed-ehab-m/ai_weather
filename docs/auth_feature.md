# Authentication Feature Documentation
## overview/
    this feature manages User Authentication (sign up , log in) Using Firebase and Sharedprefrence

## Architecture (CLEAN ARCH and Follows MVVM Pattern)/
###  1-Data Layer 
### Manages Authentication Data
 `AuthRemoteDataSource` → Handles Firebase Authentication.
 `AuthRepositoryImpl` → Implements `AuthRepository`.

###  2-Domain Layer
### Contains BusinessLogic 
 `AuthRepository` => Abstract Repositry Interface
 `LoginUseCase` → Handles user login.
 `SignUpUseCase` → Handles user registration.

### 3-Presentation Layer**
### Handels UI , STateManagement
- `AuthCubit` → Manages authentication state.

## Demo Video
https://github.com/user-attachments/assets/411a344c-b09c-4c5a-b057-73c268ecd726
