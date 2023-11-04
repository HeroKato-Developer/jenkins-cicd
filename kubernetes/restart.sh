# sshpass -p 'kato00ftw' ssh -o StrictHostKeyChecking=no kato@cryptoarena.app "microk8s kubectl rollout restart -n devops-tools deployment test-node"
microk8s kubectl delete -f deploy.yaml
microk8s kubectl apply -f deploy.yaml