This rule is part of the Kubernetes [Pod Security Standards (PSS) restricted policies](https://kubernetes.io/docs/concepts/security/pod-security-standards/#restricted).  
This rule checks whether the Kubernetes pod is running root containers.  
This rule fails if the `runAsNonRoot` key is set to false.  
By default, the key 'runAsNonRoot' is set to false, and the container may run with root privileges.  
Containers running as root run with uid=0, meaning they run as root processes on the host.  
An attacker who manages to break out of the container may gain root privileges on the host.  
Most containers do not require root privileges, which is why running as root should be avoided to minimize risks.