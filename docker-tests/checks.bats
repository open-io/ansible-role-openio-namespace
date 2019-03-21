#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests
@test 'NAMESPACE - basic test' {
  run bash -c "docker exec -ti ${SUT_ID} cat /etc/oio/sds.conf.d/TRAVIS"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ 'TRAVIS' ]]
}

@test 'NAMESPACE - zk_chain test' {
  run bash -c "docker exec -ti ${SUT_ID} cat /etc/oio/sds.conf.d/TRAVIS"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ 'zookeeper=172.17.0.2:6005,172.17.0.3:6005,172.17.0.4:6005;172.17.0.5:6005,172.17.0.6:6005,172.17.0.7:6005' ]]
}
