
TestLogDownloadMAVProxyNetwork

/tmp/buildlogs/ArduSub-TestLogDownloadMAVProxyNetwork.txt
...
2024-01-04T22:03:55.4419492Z AT-0243.2: Starting MAVProxy
2024-01-04T22:03:55.4419892Z PYTHONPATH: /__w/ardupilot/ardupilot/Tools/mavproxy_modules
2024-01-04T22:03:55.4421205Z Running: "mavproxy.py" "--master" "mcast:" "--sitl" "localhost:5501" "--aircraft" "test.ArduSub" "--streamrate=10" "--target-system=1" "--target-component=1" "--default-modules" "misc,wp,rally,fence,param,arm,mode,rc,cmdlong,output"
2024-01-04T22:03:55.4422270Z Connect mcast: source_system=255
2024-01-04T22:03:55.4422593Z no script test.ArduSub/mavinit.scr
2024-01-04T22:03:55.4423016Z Log Directory: test.ArduSub/logs/2024-01-04/flight8
2024-01-04T22:03:55.4423552Z Telemetry log: test.ArduSub/logs/2024-01-04/flight8/flight.tlog
2024-01-04T22:03:55.4424146Z AT-0243.6: LOGFILE test.ArduSub/logs/2024-01-04/flight8/flight.tlog
2024-01-04T22:03:55.4424689Z AT-0243.6: buildlog=/tmp/buildlogs/ArduSub-test.tlog
2024-01-04T22:03:55.4425164Z AT-0243.6: OSError [18]: Invalid cross-device link
2024-01-04T22:05:57.0850737Z AT-0243.6: WARN: Failed to create link: test.ArduSub/logs/2024-01-04/flight8/flight.tlog => /tmp/buildlogs/ArduSub-test.tlog, will copy tlog manually to target location

...
Downloading log with UDPMulticast mcast:
...

82Z AP: ArduSub V4.5.0-dev (abcdef)
2024-01-04T22:05:57.0870394Z AP: 260748ee710842fc996f4d815438f1cc
2024-01-04T22:05:57.0870708Z AP: Frame: VECTORED
2024-01-04T22:05:57.0870969Z AP: EKF3 IMU0 is using GPS
2024-01-04T22:05:57.0871246Z AP: EKF3 IMU1 is using GPS
2024-01-04T22:05:57.0871569Z AT-0249.3: AP: EKF3 IMU0 is using GPS
2024-01-04T22:05:57.0871945Z AT-0249.4: AP: EKF3 IMU1 is using GPS
2024-01-04T22:05:57.0872269Z Received 1392 parameters
2024-01-04T22:05:57.0872746Z Saved 1392 parameters to test.ArduSub/logs/2024-01-04/flight8/mav.parm
2024-01-04T22:05:57.0873230Z Timed out looking for Finished downloading
2024-01-04T22:05:57.0873617Z AT-0365.2: Exception caught: 120
2024-01-04T22:05:57.0873934Z Traceback (most recent call last):
2024-01-04T22:05:57.0874568Z   File "/__w/ardupilot/ardupilot/Tools/autotest/vehicle_test_suite.py", line 8303, in run_one_test_attempt
2024-01-04T22:05:57.0875198Z     test_function(**test_kwargs)
2024-01-04T22:05:57.0875840Z   File "/__w/ardupilot/ardupilot/Tools/autotest/vehicle_test_suite.py", line 4361, in TestLogDownloadMAVProxyNetwork
2024-01-04T22:05:57.0876583Z     mavproxy.expect("Finished downloading", timeout=120)
2024-01-04T22:05:57.0877241Z   File "/__w/ardupilot/ardupilot/Tools/autotest/pysim/util.py", line 704, in _expect_callback
2024-01-04T22:05:57.0877825Z     raise pexpect.TIMEOUT(timeout)
2024-01-04T22:05:57.0878176Z pexpect.exceptions.TIMEOUT: 120

....