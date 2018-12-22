# pg-k8s-ns-quotas

Playground repo for demoing namespace quotas and limit range.

Kubernetes namespaces are like virtual clusters on your actual cluster. If used properly namespaces with resource quotas can really create a setup where multiple teams can co-exist on single cluster separated by namespaces. Without properly applying quotas cluster administration could be a bit of a nightmare when apps from one team's namespace are chewing up resources from the entire cluster there by draining resources from other namespace.

In this example we build a Spring boot application (because JVMs ;p) which we will deploy in a namespace with quotas and a namespace without quotas to see what happens when an application  goes rogue. We will also deploy grafana and prometheus to track cpu, memory usage via dashboards.


## Deploy application

Create namespace with quotas
```
make create-ns
```

Deploy sample jvm
```
make deploy-sample-jvm-app NS=quotas
```

Deploy sample prometheus:
```
make deploy-prom
```

Deploy grafana
```
make deploy-grafna
```

## TODO:

- Add description on quotas and limit range to the readme
- Add grafana dashboards
- Make the JVM app go rouge (should not be difficult :p)
- Deploy elastic to show logs
