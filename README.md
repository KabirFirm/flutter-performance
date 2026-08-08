# Flutter Performance Lab 🚀

A hands-on Flutter laboratory for learning, investigating, measuring, and optimizing application performance using **Flutter DevTools** and production-oriented engineering practices.

This project is built as a practical learning environment rather than a simple demo. Each lab intentionally introduces a performance problem, uses DevTools to identify the bottleneck, applies an optimization, and measures the result.

> **Profile first. Understand the bottleneck. Optimize with evidence. Measure again.**

---

## 🎯 Goals

The main goals of this project are to develop a deep, practical understanding of:

* Flutter rendering and frame lifecycle
* UI thread and Raster thread
* Widget rebuilds
* Layout and painting
* Frame rendering and jank
* CPU-intensive Dart code
* Memory allocation and leaks
* Network performance
* Image and asset performance
* Application size
* Flutter DevTools
* Performance profiling and optimization
* Clean Architecture in Flutter
* Performance-oriented production practices

---

## 🛠️ Technology Stack

* **Flutter**
* **Dart**
* **Flutter DevTools**
* **Android Studio**
* **Clean Architecture**
* **Git & GitHub**

---

## 🏗️ Project Architecture

The project follows a pragmatic, feature-first Clean Architecture approach.

```text
lib/
├── core/
│   ├── constants/
│   ├── utils/
│   └── performance/
│
├── features/
│   ├── home/
│   │   └── presentation/
│   │
│   ├── rebuild_lab/
│   │   ├── presentation/
│   │   └── domain/
│   │
│   ├── scrolling_lab/
│   │   ├── presentation/
│   │   └── domain/
│   │
│   ├── layout_lab/
│   │   └── presentation/
│   │
│   ├── paint_lab/
│   │   └── presentation/
│   │
│   ├── cpu_lab/
│   │   ├── presentation/
│   │   └── domain/
│   │
│   ├── memory_lab/
│   │   ├── presentation/
│   │   └── domain/
│   │
│   ├── network_lab/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── image_lab/
│       └── presentation/
│
└── main.dart
```

Architecture is intentionally **pragmatic**. Layers are introduced when they provide value rather than forcing unnecessary abstractions into simple performance experiments.

---

# 🔬 Performance Labs

The project will contain independent experiments focused on specific performance problems.

| Lab              | Focus                                | DevTools                      |
| ---------------- | ------------------------------------ | ----------------------------- |
| 🔄 Rebuild Lab   | Excessive widget rebuilds            | Widget Inspector, Performance |
| 📜 Scrolling Lab | List and scrolling performance       | Performance                   |
| 📐 Layout Lab    | Expensive layout and constraints     | Widget Inspector, Performance |
| 🎨 Paint Lab     | Expensive painting and compositing   | Performance                   |
| ⚙️ CPU Lab       | CPU-intensive Dart operations        | CPU Profiler                  |
| 🧠 Memory Lab    | Allocations, GC and memory leaks     | Memory                        |
| 🌐 Network Lab   | API latency and network behavior     | Network                       |
| 🖼️ Image Lab    | Image decoding, memory and rendering | Performance, Memory           |
| 📦 App Size Lab  | APK/AAB size analysis                | App Size                      |
| 🐞 Debugging Lab | Runtime debugging techniques         | Debugger                      |

More labs will be added as the project evolves.

---

# 🔍 Performance Investigation Methodology

Every performance experiment follows the same engineering workflow:

```text
        Performance Problem
                ↓
          Form Hypothesis
                ↓
            Profile App
                ↓
          Collect Evidence
                ↓
        Identify Bottleneck
                ↓
          Apply Optimization
                ↓
          Profile Again
                ↓
        Measure Improvement
```

The goal is to avoid premature optimization and make performance improvements based on measurable evidence.

---

# 📊 Before → Diagnose → After

Each significant lab documents the optimization process.

### Example

**Problem**

A scrolling screen experiences visible jank.

**Hypothesis**

The UI thread may be spending too much time rebuilding widgets.

**Investigation**

Flutter DevTools Performance Timeline and Widget Inspector are used to identify expensive frames and unnecessary rebuilds.

**Optimization**

State is moved closer to the widgets that actually depend on it.

**Result**

The screen is profiled again and the before/after results are documented.

This approach is repeated across the different performance labs.

---

# 🧰 Flutter DevTools Skills

This project is designed to develop practical expertise with:

### Performance

* Frame timing
* Frame budget
* Jank
* UI thread
* Raster thread
* Timeline events
* Build/layout/paint investigation

### Widget Inspector

* Widget tree
* Element tree
* Render tree
* Constraints
* Layout inspection
* Rebuild tracking

### CPU Profiler

* CPU sampling
* Call stacks
* Expensive Dart functions
* CPU hotspots
* Synchronous vs asynchronous work

### Memory

* Heap usage
* Allocation tracking
* Garbage collection
* Retained objects
* Memory growth
* Leak investigation

### Network

* HTTP requests
* Request/response timing
* Payload inspection
* Network bottlenecks

### App Size

* APK/AAB analysis
* Assets
* Native libraries
* Dart code
* Dependency impact

---

# 🧪 Performance Testing Philosophy

This project follows several principles:

### 1. Measure before optimizing

Don't optimize based solely on assumptions.

### 2. Reproduce the problem

A performance issue should be reproducible whenever possible.

### 3. Identify the bottleneck

A slow screen does not automatically mean the widget tree is the problem.

### 4. Make one meaningful change

This makes the effect of an optimization easier to measure.

### 5. Profile again

An optimization is not successful until the measurements demonstrate improvement.

### 6. Optimize for the user

The ultimate goal is a smoother and more responsive application—not simply a better-looking DevTools graph.

---

# 📈 Performance Metrics

Depending on the experiment, measurements may include:

* Frame duration
* UI thread duration
* Raster thread duration
* Janky frames
* FPS
* CPU usage
* Memory usage
* Allocation rate
* Garbage collection
* Network latency
* Response size
* APK/AAB size

Before/after measurements will be documented for significant optimizations.

---

# 🎓 What This Project Demonstrates

This repository is intended to demonstrate practical Flutter engineering skills including:

* Flutter performance profiling
* Flutter DevTools
* Performance debugging
* Rendering pipeline understanding
* Widget rebuild optimization
* Efficient state management
* CPU optimization
* Memory management
* Network optimization
* Image optimization
* Clean Architecture
* Profiling-driven development

---

# 🚀 Getting Started

### Prerequisites

* Flutter SDK
* Dart SDK
* Android Studio
* Android Emulator or physical Android device

Verify your Flutter installation:

```bash
flutter doctor
```

### Clone the repository

```bash
git clone <repository-url>
cd flutter-performance-lab
```

### Install dependencies

```bash
flutter pub get
```

### Run the application

```bash
flutter run
```

### Profile the application

Performance experiments should generally be evaluated using **profile mode** on a real or representative device.

```bash
flutter run --profile
```

Then open Flutter DevTools and select the relevant tool for the experiment.

---

# 🗂️ Documentation

Each lab will contain its own documentation covering:

```text
Problem
   ↓
Expected behavior
   ↓
Reproduction steps
   ↓
DevTools investigation
   ↓
Root cause
   ↓
Optimization
   ↓
Before/After measurement
   ↓
Lessons learned
```

---

# 📚 Learning Progress

* [ ] Flutter rendering pipeline
* [ ] Frame budget and jank
* [ ] UI vs Raster thread
* [ ] Widget Inspector
* [ ] Rebuild profiling
* [ ] Performance Timeline
* [ ] CPU Profiler
* [ ] Memory Profiler
* [ ] Network profiling
* [ ] Image performance
* [ ] Layout performance
* [ ] Paint performance
* [ ] App size analysis
* [ ] Production performance debugging

---

# 📌 Project Philosophy

> **Performance is not about making everything faster.
> Performance is about finding the right bottleneck and improving what actually matters.**

This lab is a continuous collection of experiments, measurements, and lessons learned while developing deeper expertise in Flutter performance engineering.

---

## 👨‍💻 Author

**Humayun Kabir**

Senior Mobile & Backend Engineer specializing in:

* Flutter
* Dart
* Kotlin
* Android
* Java / Spring Boot
* Clean Architecture
* PostgreSQL
* Firebase

---

⭐ If you find this project useful, feel free to explore the individual labs and their performance investigations.
