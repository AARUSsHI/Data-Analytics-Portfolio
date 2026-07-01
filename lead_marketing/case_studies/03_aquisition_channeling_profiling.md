# Acquisition Channel Analysis

## Objective

Identify how different acquisition channels contribute to successful customer acquisition and understand the characteristics of converted leads.

## Dataset Scope

The analysis combines Marketing Qualified Leads (MQLs) with Closed Deals using the `mql_id` field.

This enables analysis of:
- Lead acquisition channels
- Landing pages
- Time-to-conversion
- Characteristics of converted businesses

However, detailed business attributes are only available for converted leads.

## Dataset Limitations

The dataset does not contain business attributes for non-converted leads.

As a result:

- Conversion rates cannot be calculated for business segment, lead type, business type, or behaviour profile.
- Comparisons between converted and non-converted businesses cannot be performed.
- This project focuses on profiling converted customers rather than explaining why other leads failed to convert.

### Acquisition Channels

- Unknown and Paid Search produced the highest observed conversion rates.
- Organic Search generated consistently strong conversion performance.
- Email marketing produced the lowest conversion rate, indicating poor lead quality or campaign effectiveness.

### Landing Pages

Two landing pages generated both high lead volume and strong conversion rates.

Rather than selecting pages with the highest conversion percentages alone, landing pages were evaluated using both conversion rate and lead volume to identify scalable acquisition channels.

### Business Profiles

Organic Search attracted a large proportion of Home Decor businesses.

Paid Search generated a balanced mix of Home Decor, Health & Beauty and Car Accessories businesses.

Different acquisition channels appear to attract different business segments, suggesting opportunities for more targeted marketing campaigns.

### Sales Cycle

65.8% of converted deals closed within 30 days.

76.7% closed within 60 days.

Approximately 82% closed within 90 days.

A smaller subset of deals required more than three months to convert, suggesting that some opportunities involve longer sales cycles or additional nurturing.

## Recommendations

- Continue investing in Organic and Paid Search due to strong conversion performance.
- Audit attribution tracking for Unknown-origin leads to improve marketing measurement.
- Investigate low-performing email campaigns.
- Study the design and messaging of high-performing landing pages and replicate successful patterns.
- Develop targeted acquisition strategies for business segments that show strong representation within successful conversions.

## Future Work

The current dataset does not provide sufficient information to identify why most Marketing Qualified Leads fail to convert.

Future analysis would benefit from:

- Sales activity logs
- Follow-up history
- CRM interaction data
- Campaign spend
- Customer engagement metrics

These variables would enable predictive lead scoring and root-cause analysis of unsuccessful conversions.
