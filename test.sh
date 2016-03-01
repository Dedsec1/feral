zmodload zsh/stat
local -a stat
local -A usage
local x
for x in **/*(.); do
  stat -A stat -- $x
  ((usage[$stat[5]] += stat[8]))
done
for x in ${(k)usage}; do
  echo $usage[$x] ${${"$(getent passwd $x)"%%:*}:-$x}
done | sort -k1n
