# Release Flow

## Objective

Define the path a release takes from source change to deployed workload in GKE.

## Flow summary

1. A source change triggers the build workflow.
2. Cloud Build performs validation and image build tasks.
3. The container image is stored in Artifact Registry.
4. Trust requirements are evaluated before deployment.
5. Cloud Deploy handles promotion through target environments.
6. Approved releases are deployed to GKE.
7. Operators use Cloud Monitoring and Cloud Logging to review outcome.

## Logical stages

### Stage 1 — Build and pre-release verification
This stage validates that the application is fit to become a release candidate.

Typical checks:
- linting
- tests
- build success
- selected security checks
- image creation

### Stage 2 — Artifact registration
The built image is pushed to Artifact Registry and becomes a candidate artifact for deployment.

### Stage 3 — Release trust
Binary Authorization and related trust rules determine whether the artifact may be deployed.

### Stage 4 — Promotion
Cloud Deploy manages release progression:
- dev
- stage
- prod

### Stage 5 — Runtime review
After deployment, operators review runtime signals before approving further promotion.

## Design intent

The key design decision is that deployment should be the result of a trusted release decision, not the default outcome of a successful build.
