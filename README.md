# nut-poc

Replica of networkupstools/nut CI workflow demonstrating fork checkout RCE via pull_request_target.

Vulnerability: The `01-make-dist.yml` workflow triggers on `pull_request_target` and checks out the
fork's `head.sha` directly, then executes fork-controlled scripts: `autogen.sh`, `configure`, `make dist`.

Impact: GITHUB_TOKEN with contents:write, pull-requests:write, issues:write, checks:write.

Used for authorized security research only.
