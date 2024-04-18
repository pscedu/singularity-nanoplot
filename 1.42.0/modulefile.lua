--
-- NanoPlot 1.42.0 modulefile
--
-- "URL: https://www.psc.edu/resources/software"
-- "Category: Biological Sciences"
-- "Description: Plotting scripts for long read sequencing data."
-- "Keywords: singularity bioinformatics"

whatis("Name: NanoPlot")
whatis("Version: 1.42.0")
whatis("Category: Biological Sciences")
whatis("Keywords: singularity bioinformatics")
whatis("URL: https://www.psc.edu/resources/software")
whatis("Description: Plotting scripts for long read sequencing data.")

help([[
Plotting scripts for long read sequencing data.

To load the module type

> module load NanoPlot/1.42.0

To unload the module type

> module unload NanoPlot/1.42.0

Tools included in this module are

* NanoPlot
]])

local package = "NanoPlot"
local version = "1.42.0"
local base    = pathJoin("/opt/packages",package,version)
prepend_path("PATH", base)
