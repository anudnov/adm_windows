#### To return a list of the volumes that have been enabled for data deduplication
```
Get-DedupVolume
```
```
Get-DedupVolume | format-list
```
Get the status of deduplication jobs
```
Get-DedupJob
```

```
Start-DedupJob -Type Optimization -Volume D: -Memory 75 -Cores 75 -Priority High
```
```
Start-DeDupJob -Type Scrubbing -Volume D: -Memory 75 -Cores 75 -Priority High
```
```
Start-DedupJob -Type GarbageCollection -Volume D: -Memory 75 -Cores 75 -Priority High
```
