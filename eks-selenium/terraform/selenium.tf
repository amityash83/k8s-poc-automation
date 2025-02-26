resource "null_resource" "selenium_setup" {
    depends_on = [ null_resource.kubeconfig_update ]

    provisioner "local-exec" {
      command = "kubectl create -f ../selenium/selenium-hub-deployment.yaml"
    }

    provisioner "local-exec" {
      command = "kubectl create -f ../selenium/selenium-hub-svc.yaml"
    }

    provisioner "local-exec" {
      command = "kubectl create -f ../selenium/selenium-node-chrome-deployment.yaml"
    }

    provisioner "local-exec" {
      command = "kubectl create -f ../selenium/selenium-node-firefox-deployment.yaml"
    }
}
