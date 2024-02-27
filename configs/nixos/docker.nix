{ config, lib, username, pkgs, inputs, ... }:
{
	environment.systemPackages = with pkgs; [
		docker-compose
	];
	virtualisation.docker = {
		enable = true;
		# storageDriver = "btrfs";
	};
}