# airflow

DAGs Airflow do projeto [caixa-de-vidro](https://github.com/caixa-de-vidro) — ingestão
de dados públicos da Câmara e Senado brasileiros.

Imagem custom buildada via GitHub Actions, publicada em
`ghcr.io/caixa-de-vidro/airflow`, deployada em k3s self-hosted.

DAGs bakeadas na imagem (sem git-sync). Executor: KubernetesExecutor.