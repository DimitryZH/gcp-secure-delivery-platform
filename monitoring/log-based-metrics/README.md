# Log-based Metrics

Store log-based metric definitions or notes here.

Suggested focus:
- release events
- deployment denials
- application error bursts

## MVP release review metric notes

The first log-based metrics should support operator review of release outcomes without creating a broad observability framework.

Minimum signals to plan:
- release events that include release identity or promotion context
- deployment denials from trust or policy enforcement
- application error bursts after a rollout
- verification or deployment failures tied to commit SHA, build ID, image digest, or verification status when those fields are available in logs

These notes are intentionally lightweight. The MVP can start with documented signal expectations before checked-in metric definitions are added.
