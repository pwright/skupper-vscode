echo '//' > fragments.adoc

hygen asciidoc check --name check-kubectl --cmd kubectl

hygen asciidoc command --name linux-install --termname setup --cmd curl%20-fL%20https%3A%2F%2Fgithub.com%2Fskupperproject%2Fskupper%2Freleases%2Fdownload%2F0.3.2%2Fskupper-cli-0.3.2-linux-amd64.tgz%20%7C%20tar%20-xzf%20-

hygen asciidoc command --name mac-install  --termname setup --cmd curl%20-fL%20https%3A%2F%2Fgithub.com%2Fskupperproject%2Fskupper%2Freleases%2Fdownload%2F0.3.2%2Fskupper-cli-0.3.2-mac-amd64.tgz%20%7C%20tar%20-xzf%20-

hygen asciidoc command --name skupper-version  --termname setup --cmd skupper%20--version


# set kube profile
hygen asciidoc command --name kubeconfig-west --termname West --cmd export%20KUBECONFIG%3D%24HOME%2F.kube%2Fconfig-west

hygen asciidoc command --name kubeconfig-east --termname East --cmd export%20KUBECONFIG%3D%24HOME%2F.kube%2Fconfig-east


# set namespace
hygen asciidoc command --name namespace-west --termname West --cmd kubectl%20create%20namespace%20west%3B%20kubectl%20config%20set-context%20--current%20--namespace%20west
hygen asciidoc command --name namespace-east --termname East --cmd kubectl%20create%20namespace%20east%3B%20kubectl%20config%20set-context%20--current%20--namespace%20east

# status
hygen asciidoc command --name status-west --termname West --cmd skupper%20status
hygen asciidoc command --name status-east --termname East --cmd skupper%20status


# init
hygen asciidoc command --name init-west --termname West --cmd skupper%20init
hygen asciidoc command --name init-east --termname East --cmd skupper%20init%20--cluster-local


# token
hygen asciidoc command --name token-west --termname West --cmd skupper%20connection-token%20%24HOME%2Fsecret.yaml
hygen asciidoc command --name token-east --termname East --cmd skupper%20connect%20%24HOME%2Fsecret.yaml

# deploy

hygen asciidoc command --name deploy-west --termname West --cmd kubectl%20create%20deployment%20hello-world-frontend%20--image%20quay.io%2Fskupper%2Fhello-world-frontend
hygen asciidoc command --name deploy-east --termname East --cmd kubectl%20create%20deployment%20hello-world-backend%20--image%20quay.io%2Fskupper%2Fhello-world-backend


# expose

hygen asciidoc command --name expose-east --termname East --cmd skupper%20expose%20deployment%20hello-world-backend%20--port%208080%20--protocol%20http
hygen asciidoc command --name expose-west --termname West --cmd kubectl%20expose%20deployment%20hello-world-frontend%20--port%208080%20--type%20LoadBalancer

# test
# hygen asciidoc command --name test-west --termname West --cmd curl%20%24(kubectl%20get%20service%20hello-world-frontend%20-o%20jsonpath%3D'http%3A%2F%2F%7B.status.loadBalancer.ingress%5B0%5D.ip%7D%3A8080%2F')



asciidoc-coalescer.rb skupper.adoc >skupper.didact.adoc

