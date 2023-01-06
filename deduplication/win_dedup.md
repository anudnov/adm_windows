#### To return a list of the volumes that have been enabled for data deduplication
```
Get-DedupVolume
```
```
Get-DedupVolume | format-list
```
## Get the status of deduplication jobs
```
Get-DedupJob
```

```
Start-DedupJob -Type Optimization -Volume D: -Memory 75 -Cores 75 -Priority High
```
#### Data integrity scrubbing job:
The Integrity Scrubbing job identifies corruption in the chunk store due to disk failures or bad sectors. When possible, Data Deduplication can automatically use volume features (such as mirror or parity on a Storage Spaces volume) to reconstruct the corrupted data. Additionally, Data Deduplication keeps backup copies of popular chunks when they are referenced more than 100 times in an area called the hotspot.
```
Start-DeDupJob -Type Scrubbing -Volume D: -Memory 75 -Cores 75 -Priority High
```
#### Garbage collection job to process deleted or modified data on the volume so that any data chunks no longer referenced are cleaned up:

```
Start-DedupJob -Type GarbageCollection -Volume D: -Memory 75 -Cores 75 -Priority High
```
