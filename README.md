#  Planner Mobile Application

---

## Getting Started ๐

To run this project you need to do the following:

- Generate route 
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

- run the project
```sh
$ flutter run 
```
---

## Feature Folder Structure
```
โ
โโโ feature
|     โโโ data
โ     โ     โโโ data source
โ     โ     โโโ model
โ     โ     โโโ repository(implementation)
โ     โโโ domain     
โ     โ     โโโ entities
โ     โ     โโโ repository(abstract)
โ     โ     โโโ use cases
โ     โโโ presentation
โ     โ     โโโ bloc/cubit
โ     โ     โโโ pages
โ     โ     โโโ widgets
โ     โ        
```

## Running Tests ๐งช

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

## Screen Record

![ezgif com-gif-maker](https://user-images.githubusercontent.com/52224298/216125656-3bf1e2c8-1530-4db5-a136-b12886132cd0.gif)


