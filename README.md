# GCP Secure Delivery Platform

Google-native secure delivery platform for GKE using Cloud Build, Cloud Deploy, Binary Authorization, Terraform, and Cloud Operations.

## Overview

This repository is a platform-style project that demonstrates how to build, verify, promote, deploy, and observe containerized workloads on Google Cloud.

It is intentionally designed around a **trusted release path** rather than a single pipeline. The core idea is simple:

**Code → Build → Verify → Store → Approve → Promote → Deploy → Observe**

The project focuses on secure software delivery to GKE with Google-native services and production-oriented operational thinking.

## Why this project matters

Many teams have CI/CD, but they do not have a clearly governed release path.

Typical gaps include:
- build and deployment are connected, but trust is weak
- artifacts are pushed without clear release controls
- deployment policies are inconsistent
- release promotion across environments is not formalized
- post-deployment validation is not tied to release decisions

This project addresses that by turning delivery into a governed system with:
- secure build orchestration
- trusted artifact handling
- controlled promotion between environments
- deployment admission controls
- cloud-native observability after release

## Core capabilities

### 1. Secure build and verification
- Cloud Build as the CI execution layer
- quality and security gates before release
- container image build workflow
- release-oriented verification flow

### 2. Trusted artifacts
- Artifact Registry as the artifact store
- Binary Authorization as the trust and deployment gate
- clear separation between built artifacts and deployable artifacts

### 3. Controlled release promotion
- Cloud Deploy pipeline for environment progression
- explicit dev → stage → prod path
- promotion as a governed action, not just a script step

### 4. GKE deployment governance
- Kubernetes manifests deployed through a controlled release path
- environment-aware rollout structure
- deployment controls centered around release trust

### 5. Cloud-native operability
- Cloud Monitoring dashboards
- Cloud Logging visibility
- operator-friendly release review workflow

## Architecture at a glance

```text
Developer push
   ↓
Secure Source / Source trigger
   ↓
Cloud Build
   ↓
Artifact Registry
   ↓
Binary Authorization
   ↓
Cloud Deploy
   ↓
GKE (dev → stage → prod)
   ↓
Cloud Monitoring + Cloud Logging
```

## Repository structure

```text
gcp-secure-delivery-platform/
├── README.md
├── docs/
│   ├── architecture.md
│   ├── release-flow.md
│   ├── security-controls.md
│   ├── binary-authorization.md
│   ├── iam-model.md
│   ├── observability.md
│   ├── operator-runbook.md
│   └── demo-scenarios.md
│   
├── terraform/
│   ├── foundation/
│   │   └── README.md
│   ├── environments/
│   │   ├── dev/README.md
│   │   ├── stage/README.md
│   │   └── prod/README.md
│   └── modules/
│       └── README.md
├── app/
│   └── sample-service/
│       ├── README.md
│       ├── Dockerfile
│       └── app.py
├── cloudbuild/
│   ├── cloudbuild-ci.yaml
│   ├── cloudbuild-verify.yaml
│   └── scripts/
│       └── README.md
├── deploy/
│   ├── clouddeploy/
│   │   └── README.md
│   └── manifests/
│       ├── base/
│       │   ├── deployment.yaml
│       │   └── service.yaml
│       ├── dev/README.md
│       ├── stage/README.md
│       └── prod/README.md
├── monitoring/
│   ├── dashboards/README.md
│   ├── alert-policies/README.md
│   └── log-based-metrics/README.md
└── diagrams/
    └── README.md
```

## Demo scenarios

See [docs/demo-scenarios.md](docs/demo-scenarios.md) for the recommended demo paths:
- happy path release
- pre-release gate failure
- Binary Authorization deployment block
- stage promotion control
- post-deployment operator review



