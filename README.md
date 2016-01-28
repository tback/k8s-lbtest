# k8s-lbtest

Demonstrates an issue with ingress loadbalancing: A majority of faulty backends will take the whole cluster offline - while there are still healthy pods left.

    kubectl scale rc/faulty --replicas=2 
