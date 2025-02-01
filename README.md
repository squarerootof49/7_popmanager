# 7_popmanager
An overkill framework-agnostic population (NPC) & ambient manager for FiveM servers, packed with features.

## Features
- ***COMPLETELY LOOPLESS*** (whoo) (unless you want to sweep the server's vehicle pool for certain vehicles, see config file)
- Vehicle density
- Parked vehicle density
- Ped density
- NPC boats
- NPC trains
- NPC garbage trucks
- Native dispatch
- Native wanted level
- Native ambient sounds (police radio, ammunation, etc.)
- Possiblity to search the server vehicle pool every X ms for specific vehicles
- Ped relationships
- Scenarios

### Refactor notes
- Initially, I was using `AddPopMultiplierSphere` for ped and vehicle density. Seemed to not work properly around 75% of the times. Used natives related to budget instead.
- Added specific areas where vehicles and peds do not spawn at all (was at some point using `AddPopMultiplierArea` with the same issues listed previously, with no luck of course)
- Added control over random NPC boats, trains and garbage trucks
- Added parked vehicle density

### Credits for the part regarding population spawn areas go to https://github.com/Demigod916 ###
### Credits for the part regarding scenarios and ped relationships go to https://github.com/Andyyy7666 ###

**If you have any suggestions regarding improvements, PLEASE let me know :)**
