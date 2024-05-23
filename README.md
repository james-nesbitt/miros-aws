# PRO terraform AWS stack for MKEx

A split terraform implementation, with charts represeting each component for the stack. 
This stack uses MKEx images on AWS, to allow an MKE swarm/kubernetes installation.

## Tools

We have no comprehensive tooling, as design requirements are still short.

Currently we are writing smaller support tooling, more to define behaviour than for
comprehensive usage.

### Chart

A small bash script that assists in running terraform commands for individual charts

e.g. start the chart
```
$/> ./chart {chart} init
$/> ./chart {chart} apply
```

e.g. destroy the chart
```
$/> ./chart {chart} destroy
```

##### chart debug mode

Running in debug mode applies `TF_LOG=debug` to terraform runs.

```
$/> ./chart --debug {chart} apply -auto-approve
```

There is an equivalent `--info` mode.

#### Chart tfvars

You have two options for tfvars:

1. use an auto.tfvars[.json] in your chart
2. create a file ./config/{key}.tfvars where key is the path to the chart, but replacing
   `/` with `_`.
3. add a `-var=` or `-var-file=` flag to the chart command after the command.

Option #1 works well for default config, or things that are not commonly tuned.
Option #2 allows keeping all of the config in one place.

## Charts

The stack is composed of multiple charts.  The charts are equivalent in priority with the
exception of the `infra` chart, which is expected to provision and install the base chart.

The charts are independent in runs, but coupled in two ways:
1. there is some common configuration tfvars at the top level
2. most charts are dependent on the principal infra chart as a remote-state source

### Infra

Core provisioning and installation, with additional support infrastructure installed
after kubernetes is ready.

### Apps

Multiple charts live in the apps folder, one for each implementation installed on the 
stack.
