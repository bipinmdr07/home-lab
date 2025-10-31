### STEP CA
#### Increase the certificate time to 90 days.

```bash
docker exec -it stepca step ca provisioner update acme \
  --x509-max-dur=2160h \
  --x509-default-dur=2160h \
  --admin-subject=step \
  --admin-provisioner=acme \
  --ca-url=https://localhost:9000 \
  --root=/home/step/certs/root_ca.crt \
  --admin-password-file=/home/step/secrets/password
```
