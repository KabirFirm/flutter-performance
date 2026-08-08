# Rebuild Lab

## Experiment 1 — Unnecessary Widget Rebuilds

### Objective

Demonstrate how state placed too high in the widget tree can cause unrelated widgets to rebuild and how expensive work inside `build()` can result in UI jank.

---

## Initial Structure

```text
RebuildLabPage
│
├── RebuildCounter
├── ExpensiveWidget
└── StudentList
```

The counter state is owned by `RebuildLabPage`.

```text
Increment
    ↓
setState()
    ↓
RebuildLabPage
    ↓
├── RebuildCounter
├── ExpensiveWidget
└── StudentList
```

---

## Intentional Performance Problem

`ExpensiveWidget` performs a deliberately expensive synchronous calculation inside its `build()` method.

This is **not production code**. It is intentionally designed to create measurable UI-thread work for the DevTools experiment.

The experiment demonstrates how an unrelated rebuild can become expensive when the rebuilt widget performs CPU-intensive work.

---

## Baseline

With `const` removed from the child widgets:

```text
🔴 RebuildLabPage rebuilt
🔴 RebuildCounter rebuilt
🟡 ExpensiveWidget rebuilt
🟠 StudentList rebuilt
```

These rebuilds occurred repeatedly when the Increment button was pressed.

### DevTools measurement

```text
Build:  27.7 ms
Raster:  2.6 ms
```

The frame was reported as **UI Jank**.

### Diagnosis

The primary bottleneck was the **UI/build phase**, not rasterization.

The expensive synchronous calculation inside `ExpensiveWidget.build()` was executed again during every unnecessary rebuild.

---

## Key Lesson

A widget rebuild is not automatically a performance problem.

The important question is:

> **What work happens during the rebuild, and how often does that work occur?**

A small widget rebuilding in a fraction of a millisecond may be insignificant.

An expensive computation repeatedly executed during the frame can cause jank.

---

## Next Experiment

The next step is to compare two optimization strategies:

1. Use `const` widgets where appropriate.
2. Move state closer to the widget that actually depends on it.

The second approach demonstrates **state locality** and reduces the rebuild scope.

Performance will be measured again using Flutter DevTools.

---

## Tools Used

* Flutter DevTools — Performance
* Flutter DevTools — Widget Inspector
* Android Studio
* Flutter Profile Mode

---

## Performance Investigation Workflow

```text
Reproduce
    ↓
Profile
    ↓
Identify slow frame
    ↓
Identify UI/Raster bottleneck
    ↓
Find unnecessary work
    ↓
Optimize
    ↓
Profile again
    ↓
Compare measurements
```

## `const` vs Non-`const` Child Widgets

An important observation during this experiment was the effect of `const` on the child widgets.

### With `const`

```dart
const ExpensiveWidget(),

const Expanded(
  child: StudentList(),
),
```

When the Increment button is pressed, `RebuildLabPage` rebuilds, but the unchanged `ExpensiveWidget` and `StudentList` subtrees are reused rather than unnecessarily rebuilding.

Observed behavior:

```text
Increment
    ↓
RebuildLabPage rebuilt
    ↓
RebuildCounter rebuilt

ExpensiveWidget   → reused
StudentList       → reused
```

**Result:** No noticeable UI lag was observed during the experiment.

---

### Without `const`

```dart
ExpensiveWidget(),

Expanded(
  child: StudentList(),
),
```

After removing `const`, the child widgets rebuilt whenever the parent rebuilt:

```text
Increment
    ↓
RebuildLabPage rebuilt
    ↓
RebuildCounter rebuilt
ExpensiveWidget rebuilt
StudentList rebuilt
```

Because `ExpensiveWidget` performs an intentionally expensive synchronous calculation inside `build()`, this unnecessary rebuild produced measurable UI-thread work.

Observed DevTools result:

```text
Build:  27.7 ms
Raster:  2.6 ms
```

The frame was reported as **UI Jank**.

### Key takeaway

`const` does not magically make Flutter applications fast. Its value in this experiment is that unchanged immutable widget configurations can be reused, helping Flutter avoid unnecessary rebuild work.

The actual performance problem was:

```text
Parent state change
      ↓
Unnecessary child rebuild
      ↓
Expensive synchronous work
      ↓
UI thread exceeds frame budget
      ↓
Jank
```

This experiment demonstrates why **avoiding unnecessary rebuilds and keeping expensive work out of the frame's critical path** are important Flutter performance practices.

