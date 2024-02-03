## Overview

This is an application whose main and only function is to show the best and worst solution scenario for the Water Jug problem.

## Screenshots
##### Home Page
![home_page](https://i.ibb.co/XFWXZXD/Simulator-Screen-Shot-i-Phone-14-2024-02-03-at-01-52-11.png)
##### Success Case
![success_case](https://i.ibb.co/3R6q1Sx/Simulator-Screen-Shot-i-Phone-14-2024-02-03-at-01-54-02.png)
##### Empty or Zero Values Case
![empty_or_zero_values_case](https://i.ibb.co/68LXWWV/Simulator-Screen-Shot-i-Phone-14-2024-02-03-at-01-52-45.png)
##### No Solution Case
![no_solutions_case](https://i.ibb.co/nL86MP1/Simulator-Screen-Shot-i-Phone-14-2024-02-03-at-02-03-37.png)

## Features
- See the wrost and best solution scenarios for the Water Jug Problem according the goals:
    -  Measure the **Wanted Amount** only with **Jug 1** and **Jug 2** values
    -  Createa UI where users can input any values for **Jug 1**, **Jug 2**, and **Wanted Amount**, and see the step-by-step solution
    -  Display **No Solution** when it's not possible

- Respecting the limitations:
    - Allowed actions: fill, empty and transfer (between the two jugs only)
    - **Jug 1**, **Jug 2** and **Wanted Amount** are greater than 0
    - **Jug 1**, **Jug 2** and **Wanted Amount** are integers (no decimals, fractions)

## Algorithm Approach
- I'm based on the fact that we can only solve this problem if the **GCD** (Great Commom Divisor) from Jug 1 and Jug 2 can divide the Wanted Amount
    ``` bash
    int _gcd({required int x, required int y}) {
        if (y == 0) {
            return x;
        }
        return _gcd(x: y, y: x % y);
    }
    ```
- First of wall I check if all limitations are satisfied with the **ValidateValuesUsecase**:
    - The first if statement I check if all values are greater than zero. If not, I return a Left saying _"All values must be greather than 0"_
    - The second if statement I check if the Wanted Amount is greater than the each Jug Value. If so, I return a Left saying _"No Solution. Wanted Amount must be lower than the each jug values"_
     - The third if statement I check if GCD from Jug 1 and Jug 2 cannot divide the Wanted Amount. If so, I return a Left saying _"No Solution. Great commom divisor between the jug values must be able to divide the wanted amount"_
     - If no Left was returned after these if statements, I return a Right to move forward with the problem.
    ``` bash
    if (jugOne <= 0 || jugTwo <= 0 || wantedAmount <= 0) {
      return const Left('All values must be greather than 0');
    } else if (wantedAmount > max(jugOne, jugTwo)) {
      return const Left(
        'No Solution\nWanted Amount must be lower than the each jug values',
      );
    } else if ((wantedAmount % _gcdUsecase(x: jugOne, y: jugTwo)) != 0) {
      return const Left(
        'No Solution\nGreat commom divisor between the jug values must be able to divide the wanted amount',
      );
    }
    return const Right(null);
    ```
- If the Jug 1, Jug 2 and Wanted Amount are valid values, I get the step list with the **GetStepListUsecase**
    - I set the from value equals to the jugOne and the to equals 0
    - I **fill** the jugOne.
    - I create a while statement checking if the from and the to value is different to wantedAmount
    - The first 10 lines of the while statement are to **transfer** the values from jugOne to jugTwo
    - After that I check if the from or the to value is equal to the wantedAmount. If so, I break the while and return the stepsList
    - The following code is an if statement to check if from value is equal to zero. If so, I **fill** the jugOne
    - And the end code is an if statement to check if to vallue is full. If so, I **empty** the jugTwo
    - After each operation (**fill**, **empty** or **transfer**) I add a StepEntity into stepsList.
    - After the while statement, I return the stepsList
    ``` bash
    int from = jugOne;
    int to = 0;
    const String fillXDescription = 'Fill Jug 1';
    final List<StepEntity> stepsList = [
      StepEntity(
        jugOne: from,
        jugTwo: to,
        description: fillXDescription,
      )
    ];
    while (from != wantedAmount && to != wantedAmount) {
      int temp = min(from, jugTwo - to);
      to += temp;
      from -= temp;
      stepsList.add(
        StepEntity(
          jugOne: from,
          jugTwo: to,
          description: 'Transfer from Jug 1 to Jug 2',
        ),
      );

      if (from == wantedAmount || to == wantedAmount) {
        break;
      }

      if (from == 0) {
        from = jugOne;
        stepsList.add(
          StepEntity(
            jugOne: from,
            jugTwo: to,
            description: fillXDescription,
          ),
        );
      }

      if (to == jugTwo) {
        to = 0;
        stepsList.add(
          StepEntity(
            jugOne: from,
            jugTwo: to,
            description: 'Empty Jug 2',
          ),
        );
      }
    }
    return stepsList;
    ```
- The **GetAllScenariosUsecase** is used to get the best and the wrost solution scenario for the Water Jug Problem.
    - I use the **GetStepListUsecase** to get the List<StepEntity> with the jugOne being the first and the second value
    - I create a map with the key being the length of each list and the value being the list itself.
    - I return an AllScenarioEntity setting the bestScenarioStepList and the wrostScenarioStepList variables using the min and max method passing the length of the both list.
    ``` bash
    final List<StepEntity> stepListFirstScenario = _getStepListUsecase(
      jugOne: jugOne,
      jugTwo: jugTwo,
      wantedAmount: wantedAmount,
    );
    final List<StepEntity> stepListSecondScenario = _getStepListUsecase(
      jugOne: jugTwo,
      jugTwo: jugOne,
      wantedAmount: wantedAmount,
    );
    final Map<int, List<StepEntity>> scenarios = {
      stepListFirstScenario.length: stepListFirstScenario,
      stepListSecondScenario.length: stepListSecondScenario,
    };
    return AllScenariosEntity(
      bestScenarioStepList: scenarios[min(
        stepListFirstScenario.length,
        stepListSecondScenario.length,
      )]!,
      wrostScenarioStepList: scenarios[max(
        stepListFirstScenario.length,
        stepListSecondScenario.length,
      )]!,
    );
    ```

## Test Cases
- Input 1:
    - Jug 1: 0
    - Jug 2: 5
    - Wanted Value: 4
- Output 1: **All values must be greater than 0**

- Input 2:
    - Jug 1: 2
    - Jug 2: 0
    - Wanted Value: 4
- Output 2: **All values must be greater than 0**

- Input 3:
    - Jug 1: 5
    - Jug 2: 10
    - Wanted Value: 0
- Output 3: **All values must be greater than 0**

- Input 4:
    - Jug 1: 2
    - Jug 2: 3
    - Wanted Value: 10
- Output 4: **No Solution**

- Input 5:
    - Jug 1: 2
    - Jug 2: 4
    - Wanted Value: 3
- Output 5: **No Solution**

- Input 5:
    - Jug 1: 3
    - Jug 2: 5
    - Wanted Value: 4
- Output 5 - Best Scenario (6 steps):

| Jug 1: | Jug 2: | Description:                        |
|-------|-------|---------------------------------------|
| 5     | 0     | Fill Jug 1                            |
| 2     | 3     | Transfer from Jug 1 to Jug 2          |
| 2     | 0     | Empty Jug 2                           |
| 0     | 2     | Transfer from Jug 1 to Jug 2          |
| 5     | 2     | Fill Jug 1                            |
| 4     | 3     | Transfer from Jug 1 to Jug 2 (SOLVED) |

- Output 2 - Wrost Scenario (8 steps):

| Jug 1: | Jug 2: | Description:                        |
|-------|-------|---------------------------------------|
| 3     | 0     | Fill Jug 1                            |
| 0     | 3     | Transfer from Jug 1 to Jug 2          |
| 3     | 3     | Fill Jug 1                            |
| 1     | 5     | Transfer from Jug 1 to Jug 2          |
| 1     | 0     | Empty Jug 2                           |
| 0     | 1     | Transfer from Jug 1 to Jug 2          |
| 3     | 1     | Fill Jug 1                            |
| 0     | 4     | Transfer from Jug 1 to Jug 2 (SOLVED) |

## App Structure
- To show my knowledge and skills to build an app scalable and maintainable, I developed following the Clean Architechture standard but only with the presenter and domain layer because theres no data retrieving from any backend
- The best principles, conecpts and patterns were used. For example, S.O.L.I.D, Clean Code, DRY, Return Early, etc...
- BLoC and Cubit for state management
- GetIt to inject my dependecies
    ```bash
    getIt.registerFactory<GCDUsecase>(GCDUsecaseImpl.new);
    getIt.registerFactory<ValidateValuesUsecase>(
      () => ValidateValuesUsecaseImpl(
        gcdUsecase: getIt.get<GCDUsecase>(),
      ),
    );
    getIt.registerFactory<GetStepListUsecase>(GetStepListUsecaseImpl.new);
    getIt.registerFactory<GetAllScenariosUsecase>(
      () => GetAllScenariosUsecaseImpl(
        getStepListUsecase: getIt.get<GetStepListUsecase>(),
      ),
    );
    ```
- Used Mockito to make the test coverage over 95%
![test_coverage](https://i.ibb.co/TcgpShC/Screenshot-2024-02-02-at-23-38-44.png)

## Development environment (flutter doctor)
- Flutter (Channel stable, 3.16.5, on macOS 13.3.1 22E772610a darwin-arm64, locale en-BR)
- Android toolchain - develop for Android devices (Android SDK version 33.0.2)
- Xcode - develop for iOS and macOS (Xcode 14.2)
- VS Code (version 1.85.2)

## Getting Started
Follow these instructions to get the app up and running on your local machine.
### Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install) must be installed on your machine.

### Installation and testing
1. Clone the repository
    ```bash
    git clone https://github.com/leandromichelforte/samo.git
    ```
2. Install dependencies
    ```
    cd samo/
    flutter pub get
    ```
3. Run it
    ```
    flutter run
    ```
4. Run the tests
    ```
    flutter test --coverage
    ```

## Packages
- [BLoC](https://pub.dev/packages/bloc)
- [Flutter BLoC](https://pub.dev/packages/flutter_bloc)
- [BLoC Test](https://pub.dev/packages/bloc_test)
- [GetIt](https://pub.dev/packages/get_it)
- [Dartz](https://pub.dev/packages/dartz)
- [Equatable](https://pub.dev/packages/equatable)
- [Mocktail](https://pub.dev/packages/mocktail)



## Support and Feedback
If you have any questions or feedback please contact me [leandromichel2306@gmail.com](mailto:leandromichel2306@gmail.com)