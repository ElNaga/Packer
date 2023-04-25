source "docker" "python_base" {
  image  = "python:3.9"
  commit = true
}

build {
  sources = [
    "source.docker.python_base"
  ]

  provisioner "shell" {
    inline = [
      "apt-get update",
      "apt-get upgrade -y",
      "pip install --upgrade pip"
    ]
  }

  post-processor "docker-tag" {
    repository = "python"
    tags       = ["latest"]
  }
}
