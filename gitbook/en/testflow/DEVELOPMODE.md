# Test flow in development mode

###  Git clone
```bash
git clone https://github.com/hilanderas/powter-server.git
```

### Run test cases
* Go to test case directory:
```bash
cd powter-server/testflow/script
```

* Run installation cases
```bash
 make -s -f function.mk install
 make -s -f function.mk uninstall
 make -s -f function.mk installafteruninstall
 make -s -f function.mk reinstall
 make -s -f function.mk reuninstall
```
* Run restart cases
```bash
 make -s -f function.mk reboot_p1
 make -s -f function.mk reboot_p2
 make -s -f function.mk restartall
```
* Run update cases
```bash
make -s -f function.mk updateconf
```
* Run abnormal state machines cases
```bash
make -s -f state.mk test_init
make -s -f state.mk test_prepared
make -s -f state.mk test_confgened
make -s -f state.mk test_confready
make -s -f state.mk test_confqueued_pop_branch
make -s -f state.mk test_confqueued_rm_branch
make -s -f state.mk test_running
```

* Run normal state machines cases
```bash
make -s -f state.mk test_init_norm
make -s -f state.mk test_prepared_norm
make -s -f state.mk test_confgened_norm
make -s -f state.mk test_confready_norm
make -s -f state.mk test_confqueued_norm
make -s -f state.mk test_running_norm
```