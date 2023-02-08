#!/usr/bin/bash
echo `sensors | grep Exhaust | awk '{print $3}'`;

