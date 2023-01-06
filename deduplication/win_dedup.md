Get-DedupJob

Start-DedupJob -Type Optimization -Volume D: -Memory 75 -Cores 75 -Priority High
Start-DeDupJob -Type Scrubbing -Volume D: -Memory 75 -Cores 75 -Priority High
Start-DedupJob -Type GarbageCollection -Volume D: -Memory 75 -Cores 75 -Priority High
