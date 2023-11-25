# Jenkins Triggers

## 1. **Poll SCM (Source Code Management) Trigger**
- **Description:** Polls the version control system (VCS) for changes at specified intervals.
- **Usage:** Suitable for projects with less frequent code changes.

## 2. **Build Periodically Trigger**
- **Description:** Triggers builds at specified time intervals using a cron-like syntax.
- **Usage:** Useful for scheduled builds, such as nightly builds or periodic tasks.

## 3. **Webhook Trigger**
- **Description:** Listens for incoming HTTP requests (webhooks) and triggers a build when a specific event occurs.
- **Usage:** Ideal for integrating Jenkins with external systems that can send webhook events.

## 4. **Build after other projects are built Trigger**
- **Description:** Triggers a build when specified upstream projects complete their builds successfully.
- **Usage:** Ensures that dependent projects are built in the correct order.

## 5. **GitHub/GitLab/Bitbucket Hooks Trigger**
- **Description:** Integrates with version control systems like GitHub, GitLab, or Bitbucket to trigger builds on code push events.
- **Usage:** Enables continuous integration with popular version control platforms.

## 6. **Pipeline SCM Trigger**
- **Description:** Monitors a version control system for changes in Jenkins Pipeline scripts and triggers builds when changes are detected.
- **Usage:** Supports automated pipeline execution upon script updates.

## 7. **Remote Trigger**
- **Description:** Allows triggering builds on remote Jenkins instances using the "Jenkins Remoting" protocol.
- **Usage:** Useful for distributed build setups or triggering builds on remote servers.

## 8. **Parameterized Trigger**
- **Description:** Enables triggering builds with specific parameters.
- **Usage:** Useful for customizing builds based on user-defined parameters.

## 9. **Upstream/Downstream Trigger**
- **Description:** Initiates downstream builds when upstream builds are completed successfully.
- **Usage:** Ensures a sequential build flow, where dependent projects follow their upstream counterparts.

These triggers provide flexibility in automating build processes, allowing Jenkins to adapt to various project requirements and integration scenarios.