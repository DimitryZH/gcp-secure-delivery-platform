# Roadmap

## Roadmap principle

The project roadmap is organized around trusted software delivery and a governed release path.

Infrastructure implementation comes after the release trust model is defined. The project should avoid becoming a generic CI/CD demo, a Terraform framework, or an over-engineered Kubernetes platform.

## Phase 1 — Trusted Release Model

Goal: define the governance model before deep implementation.

Scope:
- release identity
- trust model
- promotion semantics
- environment policies
- MVP complexity boundaries

Expected outputs:
- documented release identity model
- documented trusted release definition
- documented environment trust differences
- documented MVP boundaries

Primary documents:
- [Release Identity](architecture/release-identity.md)
- [Trust Model](architecture/trust-model.md)
- [Environment Policies](architecture/environment-policies.md)
- [MVP Boundaries](architecture/mvp-boundaries.md)

## Phase 2 — Minimal Executable Foundation

Goal: create the smallest reproducible Google-native platform baseline.

Scope:
- Terraform foundation
- Artifact Registry
- one GKE cluster
- dev, stage, and prod namespaces
- IAM baseline
- Cloud Build trigger path

Constraints:
- avoid premature abstractions
- avoid excessive Terraform modules
- avoid multi-cluster design
- keep the baseline understandable and reproducible

## Phase 3 — Executable Trusted Path

Goal: make verification and trust affect deployment eligibility.

Scope:
- real verification logic
- release metadata generation
- image digest capture
- minimal attestation concept
- Binary Authorization policy
- blocked deployment scenario

Expected outcome:
- a verified release can deploy
- an untrusted artifact is blocked
- operators can explain why deployment was allowed or denied

## Phase 4 — Controlled Promotion

Goal: implement explicit environment progression.

Scope:
- Cloud Deploy delivery pipeline
- dev → stage → prod targets
- explicit promotion model
- release progression records
- environment-specific deployment expectations

Constraints:
- use one GKE cluster for MVP
- use namespaces for environment separation
- avoid advanced Kubernetes architecture unless needed for the release path

## Phase 5 — Operational Visibility

Goal: connect runtime visibility to release identity.

Scope:
- release metadata exposed or correlated at runtime
- dashboards for deployment health
- logs tied to release and environment
- deployment visibility
- operator review flow

Expected outcome:
- operators can identify what was deployed, where, when, and whether it is healthy
- observability supports promotion decisions

## Phase 6 — Demo Packaging

Goal: package the project as a runnable portfolio-grade demonstration.

Scope:
- happy path release
- failed verification scenario
- blocked deployment scenario
- controlled promotion scenario
- operator review scenario
- final documentation and demo walkthrough

Expected outcome:
- the repository demonstrates trusted delivery, governed promotion, deployment trust, and operational review as one coherent system
