# Uninstall 

### Uninstall the services 
Delete all services, `info`, `conf` in project and installation package for each module
```bash
cd powter-server
make uninstall 
```

### Check state after uninstallation
State will stay in init after uninstallation
```bash
make test_state
```