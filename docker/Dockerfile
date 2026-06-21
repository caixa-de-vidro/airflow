FROM apache/airflow:slim-3.2.2-python3.12

ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

RUN pip install --no-cache-dir \
    "apache-airflow==${AIRFLOW_VERSION}" \
    "apache-airflow-providers-cncf-kubernetes" \
    "apache-airflow-providers-fab" \
    "apache-airflow-providers-postgres" \
    --constraint "${HOME}/constraints.txt"

# DAGs baked
COPY --chown=airflow:root dags/ /opt/airflow/dags/
    