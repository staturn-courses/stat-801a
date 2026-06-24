# Project 1 — Grading Rubric (100 pts)

This file presents the rubric as two tables: one for Problems 1–12 (85 pts) and one for Global grading items (15 pts). Each row gives the full-credit, half-credit, and no-credit descriptions.

| Question | Full credit | Half credit | No credit |
|---|---:|---:|---:|
| Problem 1 (5 pts) | `ne_work_commute` read from `travel-time-31109.csv` and `head(...,10)` shown (5 pts) | Data loaded but wrong object name or `head()` shows <10 rows (2.5 pts) | Data not loaded or `head()` missing (0 pts) |
| Problem 2 (5 pts) | `dim()` used and correct rows × columns stated in one sentence (5 pts) | `dim()` present but sentence missing or minor numeric error (2.5 pts) | Missing or incorrect dimensions (0 pts) |
| Problem 3 (5 pts) | Correct mean of `TRANTIME` (5 pts) | Mean present but minor rounding or formatting issues (2.5 pts) | Missing/incorrect mean (0 pts) |
| Problem 4 (5 pts) | Correct median of `TRANTIME` (5 pts) | Median present but minor issue (2.5 pts) | Missing/incorrect median (0 pts) |
| Problem 5 (5 pts) | Correct variance of `TRANTIME` (5 pts) | Variance present but population/sample confusion (2.5 pts) | Missing/incorrect variance (0 pts) |
| Problem 6 (5 pts) | Correct SD of `TRANTIME` (5 pts) | SD present but minor issues (2.5 pts) | Missing/incorrect SD (0 pts) |
| Problem 7 (5 pts) | `summary()`/quantiles shown and Q1/Q2/Q3 identified (5 pts) | Quartiles shown but not clearly labeled or rounding small (2.5 pts) | Missing/incorrect quartiles (0 pts) |
| Problem 8 (8 pts) | Histogram produced with title/labels and sensible bins (8 pts) | Histogram produced but missing labels/title or poor bins (4 pts) | No histogram or fails to render (0 pts) |
| Problem 9 (7 pts) | Clear justification choosing mean or median based on distribution (7 pts) | Reasonable choice but vague explanation (3.5 pts) | No answer or incorrect reasoning (0 pts) |
| Problem 10 (8 pts) | Correct Q1/Q3/IQR, bounds, and `filtered_travel_time` created (original preserved) (8 pts) | Filter implemented but boundary or preservation issues (4 pts) | No filtering or incorrect implementation (0 pts) |
| Problem 11 (7 pts) | Histogram of `filtered_travel_time` with labels/title (7 pts) | Plot produced but missing labels or wrong dataset (3.5 pts) | No plot or fails to render (0 pts) |
| Problem 12 (15 pts) | Correct mean/median/variance/SD for filtered data, rounded to 2 decimals, formatted table (15 pts) | Table present but formatting/rounding or 1–2 incorrect stats (7.5 pts) | No table or many incorrect values (0 pts) |

## Global grading (15 pts)

| Item | Full credit | Half credit | No credit |
|---|---:|---:|---:|
| Reproducibility & Code Quality (10 pts) | Quarto renders without error; required packages loaded; clear, commented code (10 pts) | Mostly renders; minor chunk/package issues; readable code (5 pts) | Does not render or code not reproducible (0 pts) |
| Submission & On-time (5 pts) | Both Quarto source and PDF submitted on time; filenames follow convention (5 pts) | Late small margin or one file missing but accepted (2.5 pts) | Missing both files or very late without permission (0 pts) |