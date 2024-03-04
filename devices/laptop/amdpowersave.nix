{ lib, config, pkgs,... }:
let
  kver = config.boot.kernelPackages.kernel.version;
in
{
  # Enables the amd cpu scaling https://www.kernel.org/doc/html/latest/admin-guide/pm/amd-pstate.html
  # On recent AMD CPUs this can be more energy efficient.

  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot = lib.mkMerge [
    (lib.mkIf (lib.versionOlder pkgs.linux.version "6.1") {
      kernelPackages = pkgs.linuxPackages_latest;
    })


    (lib.mkIf (lib.versionAtLeast config.boot.kernelPackages.kernel.version "6.2") {
      kernelParams = ["amdgpu.sg_display=0"];
    })
    (lib.mkIf
      (
        (lib.versionAtLeast kver "5.17")
        && (lib.versionOlder kver "6.1")
      )
      {
        kernelParams = [ "initcall_blacklist=acpi_cpufreq_init" ];
        kernelModules = [ "amd-pstate" ];
      })
    (lib.mkIf
      (
        (lib.versionAtLeast kver "6.1")
        && (lib.versionOlder kver "6.3")
      )
      {
        kernelParams = [ "amd_pstate=passive" ];
      })
    (lib.mkIf (lib.versionAtLeast kver "6.3") {
      kernelParams = [ "amd_pstate=active" ];
    })
  ];
}
