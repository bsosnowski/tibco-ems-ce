# TIBCO EMS Community Edition
Simple docker image for TIBCO EMS Community Edition.

Currently it was tested with version 10.3.0.

## Installation

1. Download *TIB_ems_10.3.0_linux_x86_64.zip* to folder named dist:
    ```
    dist
    └── TIB_ems_10.3.0_linux_x86_64.zip
    ```
2. Build image by executing:
    ```bash
    ./build.sh
    ```

3. Use docke-compose to run it:  
    ```bash
    docker-compose up -d
    ```

4. You can filter your new image using labels:
    ```bash
    docker images --filter "label=vendor=TIBCO"
    ```

## OpenTelmetry
The TIBCO EMS 10.3.0 release introduces Prometheus metrics. [docker-compose](docker-compose.yml) provides Otel Collector, which scraps EMS metrics and sends them to the Prometheus endpoint. To enable OTEL Collector, run `docker compose up` with the `otel` profile enabled:

```
docker compose --profile otel up
```