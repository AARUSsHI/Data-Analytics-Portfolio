# Funnel Analysis – Orders Dataset

## Objective
Analyze order lifecycle and identify drop-offs in the funnel.

---

## Key Findings

- ~97% of orders are successfully delivered
- Very low failure rate (~1.2%)
- Majority of failures occur due to:
  - Order cancellations
  - Product unavailability

---

## Funnel Interpretation

The dataset represents final order statuses rather than step-by-step transitions.

This means:
- True funnel drop-off between stages cannot be directly calculated
- However, outcome distribution gives a proxy view of system performance

---

## Drop-off Insight

- The effective drop-off occurs at the final stage:
  - canceled (~0.63%)
  - unavailable (~0.61%)

- Early-stage drop-offs (created → approved) cannot be measured due to lack of sequential data

---

## Business Interpretation

- The system is highly efficient with a strong delivery rate
- Minimal operational friction in order processing
- Failures are primarily due to:
  - inventory issues
  - customer-driven cancellations

---

## Recommendations

1. Improve inventory management to reduce unavailability
2. Analyze cancellation reasons (payment, UX, delays)
3. Track stage-level timestamps for accurate funnel analysis
