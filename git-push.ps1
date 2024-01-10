#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS         #
#                                   #
#####################################

Write-Host "#############################" -ForegroundColor Cyan
Write-Host "#      Git Push Script      #" -ForegroundColor Cyan
Write-Host "#############################" -ForegroundColor Cyan
Write-Host "" # add a new line #

# get branch name (e.g master, main, etc... ) #
$DEFAULT_BRANCH = git branch --show-current
$TARGET_BRANCH = $DEFAULT_BRANCH

Write-Host -NoNewline "[*] Your Current Branch : " -ForegroundColor Red
Write-Host $DEFAULT_BRANCH -ForegroundColor Yellow
Write-Host "" # add a new line #

# get new updates if it founded #
Write-Host "[+] Updating Repo..." -ForegroundColor Red
Write-Host "" # add a new line #
git pull
Write-Host "" # add a new line #

# get default commit message based on changes #
$DEFAULT_COMMIT_MSG = @("")

# git status #
$STATUSES = @(git status -s)

for ($i = 0; $i -lt $STATUSES.Count; $i++) {
    $currentStatus = $STATUSES[$i].Trim()

    if ($currentStatus -match '^D') {
        Write-Host "    ==> deleted : $($currentStatus -replace '^D\s*')" -ForegroundColor Red
        $DEFAULT_COMMIT_MSG += "    ==> deleted : $($currentStatus -replace '^D\s*')" + "`n"
    }
    elseif ($currentStatus -match '^M') {
        Write-Host "    ==> modified : $($currentStatus -replace '^M\s*')" -ForegroundColor Cyan
        $DEFAULT_COMMIT_MSG += "    ==> modified : $($currentStatus -replace '^M\s*')" + "`n"
    }
    elseif ($currentStatus -match '^\?\?') {
        Write-Host "    ==> added : $($currentStatus -replace '^\?\?\s*')" -ForegroundColor Green
        $DEFAULT_COMMIT_MSG += "    ==> added : $($currentStatus -replace '^\?\?\s*')" + "`n"
    }

}

# Check if $DEFAULT_COMMIT_MSG is empty #
if ($DEFAULT_COMMIT_MSG -eq "") {

    Write-Host "    ==> NO changes" -ForegroundColor Yellow
    $DEFAULT_COMMIT_MSG = "    ==> NO changes"

}

# add a new line #
Write-Host ""

# Initialize variables #
$CREATE_PR = $false
$TARGET_PR_BRANCH = $null

# Loop through all arguments #
while ($args) {
    switch ($args[0]) {
        "--target-branch" {
            $args = $args[1..$args.length]
            $TARGET_BRANCH = $args[0]
            $args = $args[1..$args.length]
        }
        "-t" {
            $args = $args[1..$args.length]
            $TARGET_BRANCH = $args[0]
            $args = $args[1..$args.length]
        }
        "--commit-msg" {
            $args = $args[1..$args.length]
            $DEFAULT_COMMIT_MSG = $args[0]
            $args = $args[1..$args.length]
        }
        "-m" {
            $args = $args[1..$args.length]
            $DEFAULT_COMMIT_MSG = $args[0]
            $args = $args[1..$args.length]
        }
        "--create-pr" {
            $CREATE_PR = $true
            $args = $args[1..$args.length]
            $TARGET_PR_BRANCH = $args[0]
            $args = $args[1..$args.length]
        }
        default {

            # Ignore unrecognized options #
            $args = $args[1..$args.length]

        }
    }
}

# Display Target Branch #
Write-Host -NoNewline "[+] Target Branch : " -ForegroundColor Red
Write-Host $TARGET_BRANCH -ForegroundColor Yellow

# Check if Target Branch is different from Default Branch #
if ($TARGET_BRANCH -ne $DEFAULT_BRANCH) {

    # Check if Target Branch exists #
    $branchExists = git show-ref --verify --quiet "refs/heads/$TARGET_BRANCH"

    if ($branchExists) {

        # Target Branch exists, switch to it #
        Write-Host -NoNewline "  └──> Changing to the Target Branch: " -ForegroundColor Blue
        Write-Host "$TARGET_BRANCH" -ForegroundColor Yellow
        Write-Host "" # add a new line #
        git checkout $TARGET_BRANCH
        Write-Host "" # add a new line #

    }

    else {

        # Target Branch does not exist, create and switch to it #
        Write-Host -NoNewline "  └──> Creating and changing to the Target Branch: " -ForegroundColor Blue
        Write-Host "$TARGET_BRANCH" -ForegroundColor Yellow
        Write-Host "" # add a new line #
        git checkout -b $TARGET_BRANCH
        Write-Host "" # add a new line #

    }
}

Write-Host "[+] Adding new changes to the repo... " -ForegroundColor Cyan
Write-Host "" # add a new line #
git add --all .

git commit -m "$DEFAULT_COMMIT_MSG"

git push -u origin $TARGET_BRANCH

# Check and create a pull request #
if ($CREATE_PR -eq $true -and $TARGET_PR_BRANCH -ne $null) {

    Write-Host "`n" # add a new line #
    Write-Host -NoNewline  "[+] Creating a pull request from " -ForegroundColor Blue
    Write-Host -NoNewline "$TARGET_BRANCH " -ForegroundColor Red
    Write-Host -NoNewline "to $TARGET_PR_BRANCH... "  -ForegroundColor Yellow
    Write-Host "`n" # add a new line #

    # Assuming you have GitHub CLI (gh) installed for PowerShell #
    gh pr create --base $TARGET_PR_BRANCH --head $TARGET_BRANCH --title "Pull Request: $TARGET_BRANCH to $TARGET_PR_BRANCH" --body "Please review and merge."

}


Write-Host "" # add a new line #
Write-Host "D O N E! " -ForegroundColor Green
Write-Host "" # add a new line #
