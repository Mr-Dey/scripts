#!/bin/bash

# List of repositories to clone
#For this repos access the azure need the vm public ssh key
REPOS=(
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/alarms-and-triggers"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/cirries-product"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/cloud-mp"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/cloud-mp-api-server"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/code-server-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/code-server-mgr-sidecar"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/config-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/copilot-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/csm"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/deployment-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/dfi-product"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/diametriq-marketplace-product"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/diametriq-product"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/docs"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/external-log-collector"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/external-repo-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/gdo"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/haud-product"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/infra-cfg-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/infra-dt-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/installer-v2"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/integration-utils"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/jenkins"
    #"git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-alerts-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-cloud-mp"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-copilot-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-db-validator"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-dependency-check-mgr"
    #"git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-events-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-external-repo-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-infrastructure-logs-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-ksm"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-local-mp"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-logs-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-machine-pool"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-nmap-automator"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-node-deployer"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-plugin-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-regal-helper"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-regal-scanner"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-repo-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-ria-mgr"
    #"git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-ria-terraform-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-sonarqube-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-syslog-date-updater"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-ticket-tracker"
    #"git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-vuln-scan-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/job-zaproxy-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/ksm"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/local-mp"
    #"git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/log-collector-product"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/logger-service"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/machine-pool-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/Migrations"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/misc-event-handler-sidecar"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/netnumber-product"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/package"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/pcap-agent"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/pcap-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/plugin-mgr"
    #"git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-3.x"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-api-server"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-controller"
    #"git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-core"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-craftx"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-craftx-api-server"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-deployment-init"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-external-log-collector"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-lib"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-pcap-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/regal-product"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/repo-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/report-service"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/ria"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/scanner"
    #"git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/scanner-sidecar"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/stats-collector"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/telaverge-product"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/test-executor"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/third-party-process-monitor"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/ticket-tracker-mgr"
    #"git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/tv-sipp-tool"
    #"git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/tv-sipp-tool-marketplace"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/uia"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/vuln-scan-mgr"
    "git@ssh.dev.azure.com:v3/telaverge/REGAL_CONTROLLER_4.0/machine-monitor"
)

# Create and navigate to the regal_services directory
mkdir -p regal_services
cd regal_services || exit 1

# Array to store error messages
declare -a ERROR_MESSAGES

# Clone repositories with detailed error logging
# Number of retry attempts for cloning repositories
RETRY_COUNT=1

clone_repo() {
    local repo=$1
    for ((i = 1; i <= RETRY_COUNT; i++)); do
        echo "Cloning $repo (Attempt $i)..."
        if git clone "$repo"; then
            echo "$repo cloned successfully."
            return 0
        else
            echo "Error cloning $repo (Attempt $i)"
            ERROR_MESSAGES+=("Error cloning $repo (Attempt $i)")
        fi
        sleep 1 # Wait before retrying
    done
    echo "Failed to clone $repo after $RETRY_COUNT attempts."
    ERROR_MESSAGES+=("Failed to clone $repo after $RETRY_COUNT attempts.")
    return 1
}

update_repo() {
    local dir=$1
    local branch="release/regal-4.9"
    cd "$dir" || return 1
    # New pull command for the main branch before checkout
    echo "Pulling latest changes from origin for $dir..."
    if ! git pull origin; then
        ERROR_MESSAGES+=("Error pulling latest changes in $dir.")
        cd - >/dev/null || return 1
        return 1
    fi
    echo "Checking out branch $branch in $dir..."
    if ! git checkout "$branch"; then
        ERROR_MESSAGES+=("Error checking out branch $branch in $dir.")
        cd - >/dev/null || return 1
        return 1
    fi
    echo "Pulling latest changes in $branch for $dir..."
    if ! git pull origin "$branch"; then
        ERROR_MESSAGES+=("Error pulling branch $branch in $dir.")
        cd - >/dev/null || return 1
        return 1
    fi
    cd - >/dev/null || return 1
    return 0
}

create_vscode_settings() {
    local base_dir=$1
    local settings_file="$base_dir/.vscode/settings.json"

    # Create the .vscode directory if it doesn't exist
    mkdir -p "$(dirname "$settings_file")"

    # Start building the JSON content
    echo '{' > "$settings_file"
    echo '  "python.analysis.extraPaths": [' >> "$settings_file"

    # Loop through the directories and add them to the JSON array
    local first=true
    for dir in "$base_dir"/*/; do
        if [ -d "$dir/.git" ]; then # Ensure it's a git repository
            if [ "$first" = true ]; then
                first=false
            else
                echo ', ' >> "$settings_file"
            fi
            # Add the directory path to the JSON array
            echo "    \"$(basename "$dir")\"" >> "$settings_file"
        fi
    done

    # Remove the last comma and close the JSON array
    sed -i '$ s/,$//' "$settings_file" # Remove last comma
    echo '  ]' >> "$settings_file"
    echo '}' >> "$settings_file"

    echo "Created $settings_file with repository paths."
}

# Main script execution
echo "Starting repository operations..."
for repo in "${REPOS[@]}"; do
    clone_repo "$repo" &
done
wait # Wait for all clone operations to finish

echo "Cloning completed. Starting branch updates..."

create_vscode_settings "$(pwd)"
base_dir="$(pwd)"
for dir in */; do
    if [ -d "$dir/.git" ]; then # Ensure it's a git repository
        echo "Updating repository in directory: $dir"
        update_repo "$dir" || ERROR_MESSAGES+=("Error updating $dir")
    else
        echo "Skipping $dir as it is not a git repository."
    fi
done

echo "All operations completed."

# Display all error messages
if [ ${#ERROR_MESSAGES[@]} -ne 0 ]; then
    echo "Errors were encountered:"
    for error in "${ERROR_MESSAGES[@]}"; do
        echo "$error"
    done
else
    echo "No errors encountered. All operations were successful."
fi
