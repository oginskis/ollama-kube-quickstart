#!/bin/sh

helm repo add ollama-helm https://otwld.github.io/ollama-helm/
helm repo add open-webui https://helm.openwebui.com/  

ollama_namespace=ollama

kubectl get ns "${ollama_namespace}" || kubectl create ns "${ollama_namespace}"

kubectl apply -f local-models.yaml   

helm repo update

helm upgrade --install ollama ollama-helm/ollama \
  --namespace "${ollama_namespace}" \
  --values values-ollama.yaml

helm upgrade --install open-webui open-webui/open-webui \
  --namespace "${ollama_namespace}" \
  --values values-open-webui.yaml \
  --set "ollamaUrls={http://ollama:11434}"



