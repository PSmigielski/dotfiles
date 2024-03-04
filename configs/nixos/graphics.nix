{ config, pkgs, ... }:

{
    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.opengl = {
        enable = true;
        extraPackages = with pkgs; [ 
            vaapiIntel 
            vaapiVdpau
            rocm-opencl-icd
            rocm-opencl-runtime
            libvdpau-va-gl 
        ];  
        driSupport = true;
        driSupport32Bit = true;
    };
}