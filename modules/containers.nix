{ config, pkgs, lib, ... }:
{

 

 home.packages = with pkgs; [
    podman
    docker
    docker-compose
    nvidia-docker
  ];

}
