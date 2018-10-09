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
  [[ "${output}" =~ '#zookeeper' ]]
}

