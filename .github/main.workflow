workflow "New workflow" {
  on = "push"
  resolves = ["Push Image"]
}

action "Docker Login" {
  uses = "actions/docker/login@76ff57a"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Login"]
  args = "build -t socratessystems/php-ci ."
}

action "Push Image" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["GitHub Action for Docker"]
  args = "push socratessystems/php-ci:latest"
}
