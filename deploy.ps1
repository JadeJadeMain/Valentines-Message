$gitPath = "C:\Program Files\Git\cmd\git.exe"

if (Test-Path $gitPath) {
    Write-Host "Found Git at $gitPath. Initializing repository..."
    
    & $gitPath init
    & $gitPath add .
    & $gitPath commit -m "Initial commit of Valentine's Message"
    & $gitPath branch -M main
    
    # Check if remote already exists (suppress error if not found)
    $remotes = & $gitPath remote
    if ($remotes -contains "origin") {
        Write-Host "Remote 'origin' already exists. Setting URL..."
        & $gitPath remote set-url origin https://github.com/JadeJadeMain/Valentines-Message.git
    } else {
        Write-Host "Adding remote 'origin'..."
        & $gitPath remote add origin https://github.com/JadeJadeMain/Valentines-Message.git
    }

    Write-Host "Pushing to GitHub..."
    & $gitPath push -u origin main
} else {
    Write-Error "Git executable not found at $gitPath. Please verify installation."
    Read-Host "Press Enter to exit..."
}
