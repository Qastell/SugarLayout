![Banner](https://github.com/Qastell/SugarLayout/assets/70092644/33033499-4400-45a8-9e99-0199da062fdb)

[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/Qastell/SugarLayout/blob/main/LICENSE)
![Platform](https://img.shields.io/badge/platform-iOS%20|%20tvOS-orange.svg?style=flat)
![GitHub Release](https://img.shields.io/github/v/release/Qastell/SugarLayout)


## Usage

### SugarLayout

```swift
view.subviews(
    someView,
    fooView.subviews(
        barView
    )
)

someView
    .center()
    .height(<=150)
    .horizontalEdges(32)

fooView
    .width(200)
    .centerX(to: someView)
    .top(50, to: someView, edge: .bottom)
    .bottom(to: view.safeAreaLayoutGuide)

barView
    .right(40, edge: .left)
    .height(80)
    .verticalEdges(>=30)
```

### instead UIKit

```swift
view.addSubview(someView)
view.addSubview(fooView)
fooView.addSubview(barView)

someView.translatesAutoresizingMaskIntoConstraints = false
fooView.translatesAutoresizingMaskIntoConstraints = false
barView.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
    someView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    someView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    someView.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
    someView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
    someView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            
    fooView.widthAnchor.constraint(equalToConstant: 200),
    fooView.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
    fooView.topAnchor.constraint(equalTo: someView.bottomAnchor, constant: 50),
    fooView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
    barView.rightAnchor.constraint(equalTo: fooView.leftAnchor, constant: -40),
    barView.heightAnchor.constraint(equalToConstant: 80),
    barView.topAnchor.constraint(greaterThanOrEqualTo: fooView.topAnchor, constant: 30),
    barView.bottomAnchor.constraint(lessThanOrEqualTo: fooView.bottomAnchor, constant: -30)
])
```

## Installation

Select `XCode` > `File` > `Add Package Dependency...`  
and add `https://github.com/Qastell/SugarLayout`.

## Inspired by 
[SteviaLayout](https://github.com/freshOS/Stevia)
