# Sales Cycle Analysis

## Business Problem

Although marketing generates qualified leads, management needs to understand how efficiently those leads are converted into customers and whether the sales process can be optimized.

## Objective

Analyze the time taken for Marketing Qualified Leads (MQLs) to become successful closed deals and identify patterns across acquisition channels.

## Dataset Limitation

The dataset contains only successful closed deals. Therefore, the analysis describes successful sales cycles but cannot explain why unsuccessful leads failed to convert.

## Key Findings

- Overall lead conversion rate: 10.53%.
- Median sales cycle: 14 days.
- Approximately 65.8% of successful deals closed within 30 days.
- Approximately 76.7% closed within 60 days.
- Approximately 82% closed within 90 days.
- Organic Search and Paid Search generated the highest number of successful deals while exhibiting similar median sales cycles (14–15 days).
- A small number of deals required significantly longer conversion periods, creating a right-skewed distribution.

## Data Quality Observation

One record produced a negative time-to-convert (-2 days), indicating a potential data quality issue or inconsistency between CRM and marketing timestamps. This record should be investigated before removal.

## Business Recommendations

- Prioritize rapid engagement during the first 30 days after lead acquisition.
- Review opportunities remaining open beyond 90 days to identify opportunities for improved sales processes.
- Investigate data quality issues related to inconsistent timestamps.
- Continue monitoring acquisition channels using both conversion rate and sales cycle duration rather than either metric alone.

## Future Work

Additional CRM activity logs, follow-up history, proposal dates, and sales representative information would enable deeper analysis of prolonged sales cycles and unsuccessful conversions.