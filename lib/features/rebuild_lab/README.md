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
