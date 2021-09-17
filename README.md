
# fix/

Currently only include gsi/ &emsp;; upp/ &emsp; and &emsp; crtm/  

## General view

Any text fix files (less than 1.5MB) will be tracked by git like other script/config/etc files in the regional_workflow repo.

Any binary or large text file will be tracked through a link (not the file content itself).   
Binary/large files themselves are stored at a fixed location (**FIX_RRFS**/) and available on Jet, Hera, Orion, WCOSS in a similar setting.
Synchronization from Jet to other HPCs may be done every week automatcially (or on-demand)

FIX_RRFS Locations at differnt HPCs:   
* **Jet**: /lfs4/BMC/nrtrr/FIX_RRFS  
* **Hera**: /scratch2/BMC/rtrr/FIX_RRFS  
* **Orion**: /work/noaa/rtrr/FIX_RRFS  
* **WCOSS**:   


The "Init.sh" script under regional_workflow will create correct links based on current HPC platform.      
   * If starting from the ufs-srweather-app, "manage_externals/checkout_externals" will run "Init.sh" automactially.
   * If cloning the "regional_workflow" indepedently, one needs to run "Init.sh" first after entering the feature/RRFS_dev1 or related branches.
   * If fix/INIT_DONE exists, it means the local work copy was already initialized for fix/.
   * generate_FV3LAM_wflow.sh will check whether the fix/.agent link exists, if not, it will run "Init.sh".   
&emsp;&emsp;&emsp;At the end of the workflow generation, it will print out something like:  
&emsp;&emsp;&emsp;&emsp;../fix/.agent points to  /mnt/lfs4/BMC/nrtrr/FIX_RRFS

## Modify text fix files
&emsp;Similar as other script/config files,  
&emsp;&emsp;git add   
&emsp;&emsp;git commit   
&emsp;&emsp;git push   
&emsp;&emsp;Pull Request  

## Modify binary/large fix files

Modifying binary/large fix files is infrequent. Esitmated 2 or 3 times per year.

Follow the folloing steps:   

1. put the binary/large file under FIX_RRFS/ on Jet using the rtrr role account       
&emsp;&emsp;for example:  FIX_RRFS/gsi/berror.rrfs_tuned_20210918       
         
2. under regional_workflow/fix/gsi     
&emsp;&emsp;ln -snf ../.agent/gsi/berror.rrfs_tuned_20210918 .     
        
3. git add berror.rrfs_tuned_20210918; &emsp; git commit; &emsp; git push myfork mybranch    

4. PR to the feature/RRFS_dev1 branch of the regional_workflow repo.      

#### Suggestions:  

1. all binary/large files under FIX_RRFS should be read-only so as to prevent accidental delete or overwrite.  
&emsp;&emsp;chmod -w -R gsi/berror.rrfs_tuned_20210918  

2. Add a descriptive suffix to the file name so as to self-describe it as much as possible. For example:  
&emsp;&emsp;3drtma_berror_stats_heightDepedent_20200528  
&emsp;&emsp;fv3_akbk_65lvl_20210806   
  
## More ...  

A preCommit git hook is installed by Init.sh. It will prevent any binary file larger than 5k and any files largeer than 1.5MB to be commited.  
An example:   
&emsp;&emsp;berror.rrfs is a large or binary file and should be trackted through a link.   
&emsp;&emsp;&nbsp;commit failed.   
(use the `file` command to check file type;  
a text file (e.g. input.nml.FV3) may be wrongly recognized as "Sendmail frozen configuration")  
  
domain sub directory should only contain domain specific files (such as geo_em*, fv3_akbk, etc)  

Don't use linked directory (crtm is an exception) as we cannot track individual files under a linked directory.    
Create a corresponding directory and link files under that directory.  
  
#### .agent --> a link to FIX_RRFS  

<img src="https://gtmos.github.io/links/agent.png" width="500">
