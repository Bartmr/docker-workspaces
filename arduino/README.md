## Notes

- Arduino devices are usually mapped to `/dev/ttyACM0`

## Commands

- Add Arduino device after container has started
  - `sudo mknod /dev/ttyACM0 c 0 166`
