# IAM Model

## Objective

Define a least-privilege IAM model for the delivery platform.

## Service account design

The project should separate responsibilities by service account where practical.

Suggested logical roles:
- build execution identity
- deployment execution identity
- infrastructure provisioning identity
- operator / reviewer identity

## IAM design principles

### 1. Separate build from deploy
The identity that builds artifacts should not automatically have broad deployment permissions.

### 2. Limit scope by function
Each identity should receive permissions aligned to one purpose.

### 3. Prefer explicit trust boundaries
Permissions should reinforce the architecture:
- build can produce
- promotion can promote
- deployment can deploy
- operators can review

## Future expansion

Later versions of this document can include:
- service account matrix
- role-to-component mapping
- environment-specific access model
