## Notes

- Arduino devices are usually mapped to `/dev/ttyACM0`

## Commands

- Add Arduino device after container has started
  - Check devices and their numbers on the host machine
    - `ls -l /dev`
    - Given this result
      ```
      crw-rw----  1 root   dialout   166,     0 set 26 18:31 ttyACM0
      ```
    - ... it means the minimal serial number is `0` the max serial number is `166`, and it belongs to the `dialout` group. This will help us identify which device we want to connect to below.
  - Connecting to the `ttyACM0` device from inside the container
    ```
    sudo mknod /dev/ttyACM0 c 166 0 && sudo chgrp dialout /dev/ttyACM0 && sudo chmod g+rw /dev/ttyACM0
    ```
    The last command allows non-root users in the hardware's respective user group to use the device.
