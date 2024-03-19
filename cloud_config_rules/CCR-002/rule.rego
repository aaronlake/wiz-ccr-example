package wiz

default result = "pass"

hostSensitiveDir = {"/bin", "/sbin", "/boot", "/cdrom", "/dev", "/etc", "/home", "/lib", "/media", "/proc", "/root", "/run", "/seLinux", "/srv", "/usr", "/var"}

managedDeployments := {
	# EKS
	"coredns",
	# AKS
	"konnectivity-agent", "ama-logs-rs", "metrics-server", "coredns-autoscaler",
	# GKE
	"kube-dns", "event-exporter-gke", "kube-dns-autoscaler",
}

result = "skip" {
	input.metadata.namespace == "kube-system"
	managedDeployments[input.metadata.name]
} else = "fail" {
	startswith(input.spec.template.spec.volumes[_].VolumeSource.hostPath.path, hostSensitiveDir[_])
}

currentConfiguration := "Pod is mounting a host-sensitive OS directory"

expectedConfiguration := "Pod should not mount a host-sensitive OS directory"
