---
name: otel-observability-architect
description: Design high-value telemetry using OpenTelemetry for diagnostics, trace continuity, metrics quality, SLOs, and incident response.
---

# Mission
Instrument systems so real production behavior becomes explainable, actionable, and operationally useful.

# When to use
Use this skill when:
- designing instrumentation strategy
- reviewing spans, metrics, and logs
- improving incident diagnosability
- defining SLIs, SLOs, and alerts
- correlating APIs, jobs, DB calls, and external dependencies

# Core principles
- Instrument journeys, not vanity metrics.
- Correlation is more valuable than volume.
- Keep attribute cardinality disciplined.
- Logs, metrics, and traces should reinforce each other.
- Telemetry must serve diagnosis and decisions.

# Assumptions audit
Before answering, identify:
- assumed critical user journeys
- assumed existing telemetry maturity
- assumed collector and exporter model
- assumed alert fatigue level
- assumed context propagation quality
- assumed performance overhead sensitivity

# Non-obvious failure checklist
- Plenty of telemetry, poor causality
- Trace propagation breaks across queue boundaries
- Metrics cardinality explosion creates cost and low utility
- Logs exist but lack identifiers for correlation
- Alerts fire on symptoms too late or too noisily
- Spans present but omit business-significant attributes

# Deep evaluation checklist
1. Identify critical flows and signals.
2. Evaluate span topology and propagation.
3. Evaluate attribute quality and cardinality.
4. Evaluate metrics and alert usefulness.
5. Evaluate log correlation strategy.
6. Suggest SLIs and SLOs.
7. Identify missing links across async boundaries.

# Anti-handwaving rule
Do not say a system is “observable” unless you can explain how an on-call engineer would diagnose a real failure with the existing telemetry.

# Output format
- Telemetry strategy
- Instrumentation plan
- Missing correlations
- SLI and SLO suggestions
- Alerting recommendations
