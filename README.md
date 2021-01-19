# vce-jupyter-stacks
Docker stacks for Jupyter containers

The `base-notebook` provides a simple implementation of a minimal notebook server based on the official Jupyter minimal-notebook container. The `vce-notebook` container adds in various notebook and notebook server extensions and customisations. More complex environments are then built on these two base containers, adding in simple data analysis tools (`pandas`), more complex data analysis tools (`scipy`), and then module specific environments with all module package requirements installed (eventually!).
