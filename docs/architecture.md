# Architecture

## Goal

The platform demonstrates a governed release path for containerized workloads on Google Cloud.

It is not centered on a single CI job. Instead, it is designed as a delivery system made of several coordinated control points:

- build
- verification
- artifact storage
- release promotion
- deployment trust enforcement
- post-deployment observability

## Architectural principles

### 1. Trusted release over simple automation
A release should not move forward only because a script completed successfully. It should move forward because it satisfies defined trust conditions.

### 2. Separation of responsibilities
Different layers have different roles:

- **Cloud Build** builds and verifies
- **Artifact Registry** stores artifacts
- **Binary Authorization** enforces deployment trust
- **Cloud Deploy** controls promotion across environments
- **GKE** runs the workload
- **Cloud Monitoring / Logging** provide runtime visibility

### 3. Promotion is explicit
Moving from one environment to another is treated as a controlled release action.

### 4. Operators need visibility
Release trust does not end at image creation. The platform includes runtime visibility so operators can assess release health.

## Reference flow

```text
Source change
   ↓
Cloud Build validates and builds
   ↓
Artifact pushed to Artifact Registry
   ↓
Binary Authorization policy determines deploy trust
   ↓
Cloud Deploy promotes release through environments
   ↓
GKE receives approved release
   ↓
Cloud Monitoring / Logging expose release health
```

## Environment model

Recommended baseline:
- **dev** — initial delivery target
- **stage** — pre-production validation
- **prod** — controlled production target

## Why this is a platform

A platform coordinates multiple components and establishes operating rules across the full release path.

This project qualifies as a platform because it defines:
- a repeatable delivery model
- a governed trust boundary for releases
- promotion rules across environments
- operator review and runtime visibility
- reusable structure rather than a one-off deployment script

## What this project is not

This repository is not:
- just a single YAML pipeline
- just a sample build trigger
- just a Kubernetes deployment example
- just a security scanning demo

It is a structured release system with multiple control points.
