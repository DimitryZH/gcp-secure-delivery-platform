# Release Identity

## Purpose

A trusted delivery platform needs a stable way to identify what is being released.

In this project, a release is not only a container image tag and not only a Cloud Deploy release name. A release is a traceable delivery unit that connects source code, build execution, artifact identity, verification outcome, promotion history, and runtime deployment.

## Release identity model

The MVP release identity is composed of the following fields:

| Field | Purpose | MVP expectation |
| --- | --- | --- |
| Source repository | Identifies where the change came from | Recorded in build metadata |
| Commit SHA | Identifies the source revision | Required for every release candidate |
| Build ID | Identifies the Cloud Build execution | Required for traceability |
| Build identity | Identifies the service account that produced the artifact | Required for trust review |
| Image repository | Identifies the approved Artifact Registry location | Required for deploy eligibility |
| Image digest | Identifies the immutable container artifact | Required for trusted deployment |
| Verification result | Identifies whether pre-deployment checks passed | Required before trust signal creation |
| Promotion state | Identifies the current environment progression | Required for operator review |

## Commit SHA usage

The commit SHA is the source revision anchor.

It should be used to:
- connect a release candidate to a source change
- support audit and troubleshooting
- generate human-readable release references
- correlate build logs, deployment records, and runtime metadata

The commit SHA alone is not sufficient as the deployment artifact identity because image tags can be mutable. It is useful for traceability, but deployment trust should be tied to the immutable image digest.

## Image digest usage

The image digest is the immutable artifact anchor.

It should be used to:
- represent the exact container image that passed verification
- create or evaluate deployment trust signals
- prevent ambiguity caused by mutable image tags
- support Binary Authorization policy decisions

For the MVP, deployment manifests and release records should prefer digest-pinned image references once the image has been built and resolved.

## Build identity

The build identity is the Google Cloud service account that executes the build and produces the artifact.

The platform should treat build identity as part of release trust because it answers:
- which principal produced the artifact
- whether the artifact came from the expected build path
- whether the producing identity had only the permissions needed for build and publish

The build identity should not automatically imply deployment authority. Build and deploy responsibilities remain separate trust boundaries.

## Release metadata expectations

Each release candidate should eventually have metadata that records:
- source repository
- commit SHA
- Cloud Build ID
- build service account
- image URI
- image digest
- verification status
- verification timestamp
- attestation reference, when available
- Cloud Deploy release name, when available
- target environment
- promotion status

For the baseline, this metadata can begin as build output and documentation. For the MVP, it should become machine-readable enough to support release review and demo scenarios.

## Immutable artifact expectations

A release candidate becomes eligible for trusted delivery only when the artifact identity is immutable.

MVP expectations:
- build may create a tag for operator readability
- deploy decisions should resolve the image to a digest
- verification should apply to the same digest that will be deployed
- promotion should move the same trusted artifact across environments unless a new release candidate is created

## Related metadata contract

The release identity fields are expanded into a practical MVP metadata contract in [Release Metadata Contract](release-metadata.md). That contract defines the expected producer and consumer for each field so future Cloud Build and Cloud Deploy implementation can stay aligned with the trusted release model.

## Non-goals

The MVP does not need a custom release database, enterprise catalog, or complex metadata service. The first version should keep release identity simple, observable, and aligned with Google-native delivery tools.
