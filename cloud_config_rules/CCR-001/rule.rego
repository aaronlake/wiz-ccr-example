package wiz

default result = "fail"

paths := {"containers", "initContainers", "ephemeralContainers"}

result = "pass" {
	input.object.spec[paths[_]][_].securityContext.runAsNonRoot == true
}

result = "pass" {
	input.object.spec.securityContext.runAsNonRoot == true
}

currentConfiguration := "The 'runAsNonRoot' field is either set to false or not set at all"

expectedConfiguration := "The 'runAsNonRoot' field should be set to true"
