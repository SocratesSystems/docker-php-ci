workflow "New workflow" {
  on = "push"
  resolves = ["Push Image"]
}

action "Docker Login" {
  uses = "actions/docker/login@76ff57a"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Build Image" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Login"]
  args = "build -t socratessystems/php-ci ."
}

action "Push Image" {
  uses = "actions/docker/cli@76ff57a"
  args = "push socratessystems/php-ci:latest"
  needs = ["Build Image"]
}
