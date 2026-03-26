# Demo Scenarios

## 1. Happy path release

A normal source change becomes a trusted release candidate, is promoted through the delivery path, and is deployed successfully.

What it demonstrates:
- build success
- artifact creation
- release promotion
- successful deployment
- healthy runtime review

## 2. Pre-release gate failure

A release candidate fails before promotion because validation or verification does not pass.

What it demonstrates:
- delivery is not automatic
- failed checks stop the release path early

## 3. Binary Authorization block

An artifact exists, but deployment is denied because trust conditions are not satisfied.

What it demonstrates:
- build success and deploy eligibility are different things
- trusted deployment is enforced

## 4. Stage promotion control

A release reaches dev, but progression to the next environment remains controlled.

What it demonstrates:
- promotion is a governed decision
- environment progression is explicit

## 5. Post-deployment operator review

A release is deployed, then reviewed using logs and dashboards before further promotion.

What it demonstrates:
- observability is part of release governance
- operators have a real role in delivery safety
