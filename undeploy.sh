#!/bin/sh

ollama_namespace=ollama

helm uninstall open-webui --namespace "${ollama_namespace}" --ignore-not-found
helm uninstall ollama --namespace "${ollama_namespace}" --ignore-not-found

kubectl delete -f local-models.yaml --ignore-not-found=true
