Follow this step to ensure that no container in a [pod]([https://kubernetes.io/docs/concepts/workloads/pods/) runs as root:
- Set the `runAsNonRoot` key to true.

  ```
  apiVersion: v1
  kind: Pod
  metadata:
    name: <name>
  spec:
	securityContext:  
	 runAsNonRoot: true  
  ```