# Logistics-Delay-Cost-Leakage-Analysis
## SLA Breach Risk & Operational Optimization
## Business Problem
Logistics operations often face hidden financial losses due to delayed deliveries and SLA breaches. Without a centralized analytical view, operations teams struggle to identify high-risk routes, vendors, and regions contributing to penalty costs and service inefficiencies.

This project aims to quantify SLA breach patterns and estimate cost leakage to enable data-driven operational decisions.
## Objective
- Measure SLA breach rate across regions, vehicle types, and weather conditions
- Quantify financial cost leakage due to delivery delays
- Identify key operational drivers of delays
- Provide actionable recommendations to reduce penalty exposure
## Dataset Overview
- Total Records: 25000 shipments
- Columns:Region, Vehicle Type, Weather, Transportation Cost,Delivery_partner, etc.
## Assumptions & Financial Logic
- SLA breach determined based on committed delivery window.
- Penalty estimated as a percentage of transportation cost for breached shipments.
- Total penalty exposure annualized based on shipment volume.
- Maximum observed delay: 3+ hours, indicating tight SLA thresholds rather than severe operational breakdown.
## Key KPIs Defined
- SLA Breach % = Total Breached Shipments / Total Shipments
- Total Cost Leakage (k) = SUM(Penalty Cost for Breached Deliveries)
- Average Delay Duration = AVG(Delay Days)
- High-Risk Region Contribution % = Region Breaches / Total Breaches
## Analytical Approach
- Data Cleaning & Validation (SQL / Excel)
- Feature Engineering for delay and risk indicators
- Exploratory Data Analysis
- Segment-wise Breach Analysis (Region, Weather, Vehicle Type)
- Financial Impact Estimation
- Interactive Dashboard Development (Power BI)
## Key Findings
- 23.22% of shipments breach SLA, indicating operational instability across the network.
- Weather is the primary risk driver: Fog conditions increase breach probability to 34% (1.46x network average), while Clear weather performs significantly better at 14.37%.
- Same-Day delivery has structurally high breach risk (50%), suggesting overcommitment in aggressive SLA promises — though financial exposure is limited due to low shipment share (0.8%).
- Regional distribution does not materially influence SLA risk; breach share aligns with shipment volume.
- Identified ₹408.2K in preventable annual penalty exposure, primarily driven by weather-sensitive routes and delivery mode variability.
## Business Impact
- Based on current breach patterns:
- Annual Penalty Exposure: 408 k
- If Company can reduce breach rate by 30% could save approx 122k  annually.
- This analysis enables proactive SLA risk management and cost optimization.
## Recommendations
- Recalibrate SLA commitments during high-risk weather conditions to reduce weather-driven breach spikes.
- Reassess Same-Day delivery promises in zones with structurally high breach probability.
- Implement early delay alerts for shipments nearing SLA thresholds to enable proactive intervention.
- Continuously monitor breach variance across vehicle types during weather volatility.
## Dashboard Preview
[Dashboard](https://github.com/Shruti-131202/Logistics-Delay-Cost-Leakage-Analysis/blob/main/delivery_logistic.pbit)
- ![SLA Performance](https://github.com/user-attachments/assets/86aaa389-ca2a-4f32-b3be-92c188ffc0df)
- ![SLA Risk](https://github.com/user-attachments/assets/3e441dc4-be35-486c-92e4-7a3506d66186)

- <img width="893" height="496" alt="image" src="https://github.com/user-attachments/assets/dd02690f-be5c-45ef-8f43-3bf6e143cefc" />



The dashboard includes:
- Executive KPI Summary
- Region-wise SLA Performance
- Delay Distribution Analysis
- Cost Leakage Breakdown
