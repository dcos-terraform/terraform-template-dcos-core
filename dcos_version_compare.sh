#/bin/sh
# USAGE: ./dcos_version_compare.sh open/dcos-versions/master open/dcos-versions/56127

set -v
diff $1/dcos-mesos-master/templates/install/run.sh $2/dcos-mesos-master/templates/install/run.sh
diff $1/dcos-mesos-master/templates/upgrade/run.sh $2/dcos-mesos-master/templates/upgrade/run.sh
diff $1/dcos-mesos-agent-public/templates/install/run.sh $2/dcos-mesos-agent-public/templates/install/run.sh
diff $1/dcos-mesos-agent-public/templates/upgrade/run.sh $2/dcos-mesos-agent-public/templates/upgrade/run.sh
diff $1/dcos-mesos-agent/templates/install/run.sh $2/dcos-mesos-agent/templates/install/run.sh
diff $1/dcos-mesos-agent/templates/upgrade/run.sh $2/dcos-mesos-agent/templates/upgrade/run.sh
diff $1/dcos-bootstrap/templates/install/run.sh  $2/dcos-bootstrap/templates/install/run.sh
diff $1/dcos-bootstrap/templates/upgrade/run.sh  $2/dcos-bootstrap/templates/upgrade/run.sh
