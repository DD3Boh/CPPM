# CPPM - Custom Power Profiles Manager

Custom Power Profiles Manager (CPPM) - Qt based GUI program to handle user made power profiles

## Install
Run the install script:

```
$ ./scripts/install.sh
```

Enable the systemd entry:

```
$ systemctl enable cppm
```

If you want to start the service without rebooting, you need to start both the service and the path files:

```
$ systemctl start cppm.service cppm.path
```

## Uninstall
Run the uninstall script:

```
$ ./scripts/uninstall.sh
```

The systemd entries will be automatically stopped and disabled, and the profile will be re-set to balanced.

## Edit profiles
By default the profiles simply change the governors for all the cpus, by writing to the cpufreq nodes.

To change the profiles behavior, just change the entries in `systemd/cppm` and run the installation script once again.

Inside the `cppm` script, the values are set inside a case, with values being:

1. Powersave
2. Balanced
3. Performance

Here's the default configuration to take as an example:

```
cores=$(nproc --ignore=1)

case "$mode" in
	"1")
		for ((policy = 0; policy <= $cores; policy++)); do
		echo "powersave" > "/sys/devices/system/cpu/cpufreq/policy$policy/scaling_governor"
		done
		;;

	"2")
		for ((policy = 0; policy <= $cores; policy++)); do
		echo "schedutil" > "/sys/devices/system/cpu/cpufreq/policy$policy/scaling_governor"
		done
		;;

	"3")
		for ((policy = 0; policy <= $cores; policy++)); do
		echo "performance" > "/sys/devices/system/cpu/cpufreq/policy$policy/scaling_governor"
		done
		;;
esac
```

This configuration can be used as-is just fine, without additional change.
