# Observability

## Objective

Make release behavior visible after deployment.

This project uses Google Cloud Operations concepts to support operator review and release confidence.

## Observability goals

### 1. Release visibility
Operators should be able to answer:
- what version was deployed
- where it was deployed
- when it was promoted
- whether it is behaving normally

### 2. Post-deployment confidence
A secure release path is stronger when release health can be assessed after rollout.

### 3. Promotion support
Signals from logs, metrics, and dashboards should support promotion decisions.

## Recommended observability components

- Cloud Monitoring dashboards
- Cloud Logging views
- release-related log filters
- alert policies tied to application health

## Recommended operator questions

- Did deployment succeed technically?
- Is the application healthy after rollout?
- Are there errors or latency spikes?
- Should promotion continue?
