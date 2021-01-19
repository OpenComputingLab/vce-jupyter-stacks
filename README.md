# vce-jupyter-stacks
Docker stacks for Jupyter containers

Images are cross-built for `amd64` (eg Intel machines) and `arm64` (eg Raspberry Pi 64 bit o/s, Mac M1 machines), and where appropriate, `arm32` (Raspberry Pi 32 bit o/s; some applications, such as MongoDB, may not be available for 32 bit platforms).

The `base-notebook` provides a simple implementation of a minimal notebook server based on the official Jupyter minimal-notebook container. The `vce-notebook` container adds in various notebook and notebook server extensions and customisations. More complex environments are then built on these two base containers, adding in simple data analysis tools (`pandas`), more complex data analysis tools (`scipy`), and then module specific environments with all module package requirements installed (eventually!).
