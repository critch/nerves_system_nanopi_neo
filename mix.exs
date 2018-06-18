defmodule NervesSystemOrangePiPcPlus.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :nerves_system_orangepi_pcplus,
     version: @version,
     elixir: "~> 1.6",
     compilers: Mix.compilers ++ [:nerves_package],
     description: description(),
     package: package(),
     deps: deps(),
     aliases: ["deps.precompile": ["nerves.env", "deps.precompile"]]
   ]
  end

  def application do
    []
  end

  defp deps do
    [{:nerves, "~> 1.0", runtime: false},
     {:nerves_system_br, "~> 1.0", runtime: false},
     {:nerves_toolchain_arm_unknown_linux_gnueabihf, "~> 1.0", runtime: false}]
  end

  defp description do
    """
    Nerves System - Orange Pi PC Plus
    """
  end

  defp package do
    [maintainers: ["Steven Critchfield"],
     files: ["rootfs-additions", "busybox_defconfig", "LICENSE",
             "mix.exs", "nerves_defconfig", "nerves.exs", "README.md",
             "VERSION", "fwup.conf", "post-createfs.sh", "uboot",
             "uboot-script.cmd", "linux"],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/critch/nerves_system_orangepi_pcplus/blob/master/mix.exs"}]
  end
end
