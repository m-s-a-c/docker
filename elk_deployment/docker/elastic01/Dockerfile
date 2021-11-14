ARG ELASTIC_VERSION

FROM docker.elastic.co/elasticsearch/elasticsearch:${ELASTIC_VERSION}

HEALTHCHECK --interval=3m --timeout=2m --start-period=45s CMD curl -f --retry=6 ---max-time 5 --retry-delay 10 --retry-max-time 60 http://localhost:9200/_cat/health || exit 1
