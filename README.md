# TIBCO EMS Community Edition
Simple docker image for TIBCO EMS Community Edition.

Currently it was tested with version 10.3.0.

## Installation

1. Download *TIB_ems_10.3.0_linux_x86_64.zip* to folder named dist.
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