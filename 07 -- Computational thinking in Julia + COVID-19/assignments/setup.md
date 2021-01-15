# Setup

1. Install Julia and start REPL
2. Install Jupyter Notebook / Lab
	```julia
	julia> using Pkg
	julia> Pkg.add("IJulia")

	julia> using IJulia
	julia> notebook()

	# Sliders / ...
	julia> Pkg.add("WebIO")
	julia> using WebIO
	julia> WebIO.install_jupyter_nbextension()
	```
3. Install some packages
	```julia
	julia> using Pkg
	julia> Pkg.add("Plots")
	julia> Pkg.add("Interact")
	julia> Pkg.add("DataFrames")
	julia> Pkg.add("CSV")
	```
