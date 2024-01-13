echo `sensors | grep  -m 1 fan | awk '{print $2}'`;
