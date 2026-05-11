# Binary Authorization

## Role in this project

Binary Authorization is the core deployment trust gate.

Its role in this repository is to represent the rule:
**an artifact may be built, but deployment still requires trust conditions to be satisfied.**

## Why it matters

Without a deployment trust gate, a successful build can move too directly into runtime.

With Binary Authorization in place, the project demonstrates a stronger control model:
- build success is necessary
- trusted artifact status is also necessary
- deploy eligibility can differ by environment
- untrusted artifacts can be blocked before they run

## MVP trust relationship

The MVP trust relationship should be simple:

```text
Cloud Build verification
  → trust signal for image digest
  → Binary Authorization policy evaluation
  → GKE admission decision
```

The attested subject should be the immutable image digest, not only a mutable image tag.

## Environment expectations

- **dev** may be intentionally relaxed while the trust path is being developed.
- **stage** should demonstrate trust enforcement before pre-production validation.
- **prod** should require the strictest MVP trust conditions and explicit promotion from stage.

## What this document should evolve to include

As the project matures, document:
- concrete attestor configuration
- policy model by environment
- trust rules for dev vs stage vs prod
- blocked deployment scenarios
- operator troubleshooting steps for denied deployment

Related architecture documents:
- [Trust Model](architecture/trust-model.md)
- [Environment Policies](architecture/environment-policies.md)
