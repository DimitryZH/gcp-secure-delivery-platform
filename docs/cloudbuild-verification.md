# Cloud Build Verification Expectations

## Purpose

Cloud Build verification is the first executable gate that decides whether a built artifact can become a trusted release candidate.

The MVP verification stage should stay small and understandable. Its purpose is to prove that verification affects deploy eligibility, not to introduce a large security toolchain.

## Verification role in the trusted path

The verification stage sits between artifact creation and deployment trust enforcement:

```text
Build artifact
  → resolve image digest
  → validate release metadata
  → run MVP checks
  → record verification result
  → prepare trust signal input
```

A successful build does not automatically mean the release is deployable. The verification stage must produce enough evidence for the trust model and environment policies to make a deployment decision.

## MVP verification checks

The MVP should start with a minimal set of checks:

| Check | Purpose | Expected result |
| --- | --- | --- |
| Release metadata completeness | Ensure the release can be reviewed and traced | Required fields are present |
| Image digest presence | Ensure the artifact identity is immutable | Digest is recorded |
| Approved image location | Ensure the artifact came from the expected registry path | Image URI matches approved Artifact Registry location |
| Source revision presence | Ensure the release maps back to source | Commit SHA is recorded |
| Build identity presence | Ensure the producing identity is reviewable | Build service account is recorded |
| Basic manifest readiness | Ensure deployment input can reference the trusted artifact | Render path or substitution expectation is clear |

These checks are intentionally narrow. Additional scanning or policy tools can be introduced later after the trusted path is executable.

## Verification output

Verification should emit or update the release metadata contract with:
- `verification_status`
- `verification_timestamp`
- `image_digest`
- `trust_signal_ref`, when available

The baseline verification build in `cloudbuild/cloudbuild-verify.yaml` writes `release-metadata.json` as a Cloud Build artifact after checking the minimum deploy eligibility inputs. It expects the triggering workflow to provide:
- `_IMAGE_URI` — the Artifact Registry image URI for the release candidate
- `_IMAGE_DIGEST` — the immutable image digest, formatted as `sha256:<digest>`
- `_BUILD_SERVICE_ACCOUNT` — the Cloud Build identity that produced the artifact

The baseline file uses explicit placeholder defaults so an ad-hoc run fails closed until the release-specific values are supplied by a trigger or operator.

A failed verification should still preserve release metadata so operators can understand why the release candidate is not deployable. The first executable baseline emits the failure reason in Cloud Build logs; preserving a structured failed metadata artifact can be added once the storage location is finalized.

## Trust signal preparation

For the MVP, verification should prepare the input needed for the minimal trust signal.

The trust signal should be tied to:
- the verified image digest
- the build that produced it
- the verification result
- the expected attestor or policy path, when implemented

The first version may document or emit this input before Binary Authorization attestation is fully automated. The important architectural rule is that the trust signal is derived from verification, not from the mere existence of an image.

## Failure semantics

Verification failure should stop the trusted release path before promotion.

A failed release candidate should not:
- be promoted to stage or prod
- receive a deployable trust signal
- be treated as equivalent to a verified artifact
- be silently replaced by a rebuilt artifact without a new release identity

## Non-goals for MVP

The MVP verification stage does not need:
- many security scanners
- custom policy engines
- complex provenance frameworks
- multi-attestor approval chains
- enterprise change management integration

Those capabilities can be added after the project demonstrates a clear verification-to-trust-to-deploy path.

## Related documents

- [Release Metadata Contract](architecture/release-metadata.md)
- [Trust Model](architecture/trust-model.md)
- [Environment Policies](architecture/environment-policies.md)
