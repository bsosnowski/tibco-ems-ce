# TIBCO EMS Community Edition
Simple docker image for TIBCO EMS Community Edition.

Currently it was tested with version 8.5.1.
Hibernate is being removed during the image build.

## Installation

1. Download *TIB_ems-ce_8.5.1_linux_x86_64.zip* to folder named dist.
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