local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-sirius') {
  settings+: {
    billing_email: "webmaster@eclipse.org",
    blog: "https://www.eclipse.org/sirius",
    default_repository_permission: "none",
    default_workflow_permissions: "write",
    dependabot_alerts_enabled_for_new_repositories: false,
    dependabot_security_updates_enabled_for_new_repositories: false,
    dependency_graph_enabled_for_new_repositories: false,
    description: "Sirius Web is a framework for building cloud graphical modelers for dedicated DSLs.",
    members_can_change_repo_visibility: true,
    members_can_delete_repositories: true,
    name: "Eclipse Sirius Web",
    packages_containers_internal: false,
    readers_can_create_discussions: true,
    twitter_username: "EclipseSirius",
    web_commit_signoff_required: false,
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/sirius/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('sirius-components') {
      allow_merge_commit: false,
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Reusable frontend and backend components for Sirius Web",
      homepage: "https://www.eclipse.org/sirius/sirius-web.html",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('STAGING_AWS_ACCESS_KEY_ID') {
          value: "********",
        },
        orgs.newRepoSecret('STAGING_AWS_SECRET_ACCESS_KEY') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          required_status_checks: [],
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('sirius-desktop') {
      allow_merge_commit: false,
      allow_squash_merge: false,
      default_branch: "master",
      description: "Sirius Desktop: desktop-based graphical modelers for dedicated DSLs",
      has_projects: false,
      has_wiki: false,
      homepage: "https://www.eclipse.org/sirius/",
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('sirius-emf-json') {
      allow_merge_commit: false,
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      dependabot_alerts_enabled: false,
      description: "JSON-based EMF Resource implementation - part of Eclipse Sirius",
      homepage: "https://www.eclipse.org/sirius/sirius-web.html",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sirius-specs') {
      allow_update_branch: false,
      default_branch: "master",
      description: "Specifications for changes to Eclipse Sirius",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sirius-web') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_alerts_enabled: false,
      description: "Sirius Web: cloud-based graphical modelers for dedicated DSLs (sample application)",
      homepage: "https://www.eclipse.org/sirius/sirius-web.html",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          required_status_checks: [],
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('sirius-website') {
      allow_merge_commit: false,
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      description: "Sources of the Eclipse Sirius website",
      has_projects: false,
      has_wiki: false,
      homepage: "https://www.eclipse.org/sirius",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
  ],
}
