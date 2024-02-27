{ config, pkgs, ... }:
{
  services.xserver = {
    # touchpad support VVVV 
    libinput.enable = true;
  };
  hardware.sensor.iio.enable = true;
}
