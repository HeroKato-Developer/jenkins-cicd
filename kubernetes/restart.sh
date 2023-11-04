# sshpass -p 'kato00ftw' ssh -o StrictHostKeyChecking=no kato@cryptoarena.app "microk8s kubectl rollout restart -n devops-tools deployment test-node"
microk8s kubectl delete ./kubernetes/deploy.yaml
microk8s kubectl apply ./kubernetes/deploy.yaml