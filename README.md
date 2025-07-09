# CTIC Observability Python POC

This repository contains a proof of concept (POC) for observability using Python. Below is an overview of the folder contents and instructions for running and managing the Docker environment.

## Folder Contents

The folder structure of this repository is as follows:

```
ctic-observability-python-poc/
├── config/               # Configuration files for observability tools
│   ├── alloy/            # Contains Alloy configuration files
│   ├── grafana/          # Contains Grafana configurations, dashboards, and datasources
│   └── prometheus/       # Contains Prometheus configuration files
├── fastapi_app/          # Application code built using FastAPI
├── tools/                # Utility scripts
├── README.md             # Documentation for the repository
├── docker-compose.yaml   # Defines services, networks, and volumes for Docker Compose
└── requirements.txt      # Python dependencies for the project
```

## How to Run the Application

1. **Build and start the containers**:
   Run the following command to build the Docker images and start the containers:
   ```bash
   docker-compose up --build -d
   ```

2. **Verify running containers**:
   To list all running containers in a formatted table, use:
   ```bash
   docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
   ```
   
   Once the containers are running, you can access the application or services as defined in the `docker-compose.yml` file. Check the `Ports` column in the `docker ps` output for the exposed ports.

3. **Access Grafana**:
   Once the containers are running, you can access Grafana in your browser using the following details:
   - **URL**: [http://localhost:3000](http://localhost:3000)
     - **User**: `admin`
     - **Pass**: `admin`

   After logging in, you can explore pre-configured dashboards for monitoring FastAPI and RabbitMQ metrics. These dashboards are automatically set up using the configurations in the `config/grafana/dashboards/` folder.

## How to Generate Traffic for the Application

Run the `request-runner.sh` script to simulate traffic for the application:

```bash
bash ./tools/request-runner.sh 
```

## How to Stop and Clean Up Containers

1. **Stop running containers**:
   To stop all running containers and remove all containers, networks, and saved data (volumes) from your setup, use:
   ```bash
   docker-compose down -v
   ```

## References

For more information on the tools and frameworks used in this project, refer to their official documentation:

- **[FastAPI](https://fastapi.tiangolo.com/)**: A lightweight and fast web framework for building APIs with Python.
- **[Docker Documentation](https://docs.docker.com/)**: Official documentation for Docker.
- **[Docker Compose Documentation](https://docs.docker.com/compose/)**: Official documentation for Docker Compose.  
- **[OpenTelemetry](https://opentelemetry.io/)**: A set of APIs, libraries, and tools for application instrumentation.
- **[OpenTelemetry Collector Documentation](https://opentelemetry.io/docs/collector/)**: Documentation for the OpenTelemetry Collector, a vendor-agnostic service for receiving, processing, and exporting telemetry data.
- **[OpenTelemetry Python SDK](https://github.com/open-telemetry/opentelemetry-python)**: The official OpenTelemetry Python SDK for instrumenting Python applications.
- **[OtelBin](https://www.otelbin.io/)**: A free telemetry debugging tool for testing OpenTelemetry traces, metrics, and logs.
- **[Grafana](https://grafana.com/docs/)**: Official documentation for Grafana.
- **[Grafana Preconfigured Dashboards](https://grafana.com/docs/grafana/latest/dashboards/)**: Documentation on managing and using preconfigured dashboards in Grafana.
- **[Grafana Alloy](https://grafana.com/)**: An all-in-one observability solution for metrics, logs, and traces.
- **[Loki](https://grafana.com/oss/loki/)**: A log aggregation system for managing logs efficiently.
- **[Prometheus](https://prometheus.io/)**: A system for monitoring and alerting based on metrics.
- **[Tempo](https://grafana.com/oss/tempo/)**: A distributed tracing backend for monitoring traces.