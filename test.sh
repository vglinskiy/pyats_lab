pyats shell --testbed-file <path to my testbed YAML file name>
dev = testbed.devices[‘<my_device_name>’]
dev.instantiate()
dev.expect_log(enable=True)
dev.connect()
exit()
