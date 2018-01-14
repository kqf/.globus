## Certificates

This repo shold be cloned into a home directory. It contains rules to create all `*.pem` certificate and key required by [alien](https://alien.web.cern.ch/).

## Usage
Fire the following commands

```bash
# Generate *.pem files
make


# Upload the certificates to lxplus home
make upload user=yourusername
```
