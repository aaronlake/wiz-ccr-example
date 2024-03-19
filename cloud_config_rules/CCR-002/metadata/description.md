This rule checks whether the Deployment contains a pod that mounts a host-sensitive OS directory.  
This rule fails if at least one `volume` contains a `VolumeSource.hostPath.path` that starts with a sensitive directory, such as bin, boot, or root (see the Rego code for the full list) in the `template.spec`.  
It is recommended to avoid mounting sensitive directories in read-write mode, as their files can be changed.  
>This rule includes a skip condition for managed Kubernetes resources to avoid non-actionable findings due to provider-defined configurations. If you would like to have findings for these resources, you can customize the rule by removing the skip condition.
