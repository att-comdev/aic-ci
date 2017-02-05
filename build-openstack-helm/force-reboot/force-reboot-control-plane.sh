#!/bin/bash
set -x
timeout 10s ssh kubenode02 "sudo su root -c 'echo 1 > /proc/sys/kernel/sysrq'"
timeout 30s ssh kubenode02 "sudo reboot -f"
timeout 10s ssh kubenode03 "sudo su root -c 'echo 1 > /proc/sys/kernel/sysrq'"
timeout 30s ssh kubenode03 "sudo reboot -f"
timeout 10s ssh kubenode04 "sudo su root -c 'echo 1 > /proc/sys/kernel/sysrq'"
timeout 30s ssh kubenode04 "sudo reboot -f"
timeout 10s ssh kubenode05 "sudo su root -c 'echo 1 > /proc/sys/kernel/sysrq'"
timeout 30s ssh kubenode05 "sudo reboot -f"
