#!/bin/bash

# This script runs a command repeatedly and prints how many times
# it has succed and failed. Useful to verify instability in automated tests.
#
# The following example runs the command `your_command` with a parameter five times.
#
# ./scripts/run_many_times.sh 'your_command --parameter="param"' 5

# Declare variables to count how many times the test passed or failed.
pass=0
fail=0

# Runs the loop
for execution in $(seq $2); do
  # Execute given command
  $1

  # Verifies the command execution result
  if [ "$?" -eq 0 ]
  then
    pass=$((pass + 1))
  else
    fail=$((fail + 1))
  fi
done

echo "
PASS: $pass
FAIL: $fail
RUNS: $execution"
