# Scrolling Lab

## Experiment 1 — Baseline Scrolling Performance

### Objective

Establish a baseline for Flutter list and scrolling performance using a large lazily built list and Flutter DevTools.

The purpose of this experiment is to understand how Flutter behaves during continuous scrolling before introducing any intentional performance problems.

The experiment focuses on:

* List construction
* Lazy item building
* Frame rendering during scrolling
* UI thread activity
* Raster thread activity
* Frame duration
* Jank

---

## Initial Structure

```text
ScrollingLabPage
│
└── StudentList
    │
    └── StudentCard
```

The list uses `ListView.builder` so that list items are created lazily as they become visible.

```text
User scrolls
     ↓
ListView.builder
     ↓
Build visible / required items
     ↓
Layout
     ↓
Paint
     ↓
Raster
     ↓
Frame displayed
```

---

## Experiment Setup

The initial implementation intentionally keeps each list item relatively simple.

The list contains a large number of students so that scrolling can be tested over a realistic amount of content.

Example:

```dart
ListView.builder(
  itemCount: 5000,
  itemBuilder: (context, index) {
    return StudentCard(
      student: students[index],
    );
  },
)
```

This is the **baseline implementation**.

It is not intended to demonstrate an optimization yet.

The purpose is to establish how the application performs under normal list-scrolling conditions.

---

## Performance Investigation

The application should be tested using:

**Flutter Profile Mode**

```bash
flutter run --profile
```

Then open:

**Flutter DevTools → Performance**

The same scrolling action should be repeated during profiling so that the results can be compared consistently between experiments.

---

## What To Observe

During scrolling, observe:

### UI Thread

Look for time spent on:

* Widget building
* Layout
* Dart execution
* Other UI-thread work

### Raster Thread

Look for time spent on:

* Painting
* Layer processing
* Rasterization

### Frame Duration

Observe whether frames remain within the available frame budget.

A frame that takes too long to complete may result in visible scrolling jank.

---

## Baseline Measurement

The following measurements will be recorded after profiling the baseline implementation:

```text
UI thread:
Raster thread:
Frame duration:
Janky frames:
FPS:
```

Actual values should be recorded from the DevTools session rather than estimated.

---

## Diagnosis

At this stage, the goal is **not to optimize the list immediately**.

First determine:

> **Is the baseline scrolling performance already healthy, and where is the rendering time being spent?**

If scrolling is smooth, the next experiment can intentionally introduce expensive work.

If scrolling already produces jank, DevTools should be used to identify the actual bottleneck before changing the implementation.

---

## Key Lesson

`ListView.builder` does not automatically guarantee perfect scrolling performance.

It provides lazy construction of list items, but the work performed by each item still matters.

A list can experience scrolling jank when individual items require excessive:

* Build work
* Layout work
* Paint work
* Raster work
* Synchronous CPU work

The important question is therefore:

> **What work is being performed for each frame while the user is scrolling?**

---

## Next Experiment

The next experiment will intentionally make list items more expensive.

The goal is to create measurable scrolling pressure and investigate how expensive widget work affects frame rendering.

The investigation will compare:

```text
Simple list item
       ↓
Expensive list item
       ↓
DevTools measurement
       ↓
Identify bottleneck
       ↓
Optimization
       ↓
Measure again
```

---

## Tools Used

* Flutter DevTools — Performance
* Flutter DevTools — Widget Inspector
* Android Studio
* Flutter Profile Mode

---

## Performance Investigation Workflow

```text
Reproduce scrolling
        ↓
Profile
        ↓
Identify slow frames
        ↓
Inspect UI / Raster activity
        ↓
Identify bottleneck
        ↓
Apply one optimization
        ↓
Profile again
        ↓
Compare measurements
```

---

## Performance Metrics

The following metrics may be recorded depending on the experiment:

* Frame duration
* UI thread duration
* Raster thread duration
* Janky frames
* FPS
* Build time
* Layout time
* Paint time
* Rasterization time

Before/after measurements will be documented for significant optimizations.

---

## Key Performance Principle

> **Do not optimize the list because it looks suspicious. Profile the scrolling experience and optimize the work that actually causes the bottleneck.**
