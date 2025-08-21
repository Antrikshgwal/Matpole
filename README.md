
# Interactive MATLAB Interpolation Tool

An interactive MATLAB script to perform five different interpolation techniques on user-provided datasets. This tool helps you estimate intermediate values from experimental or tabulated data and visualize interpolated curves.

## Features

- **Supports 5 interpolation techniques:**
	1. Linear Interpolation

	## How to Use

	1. **Clone the Repository**
		```sh
		git clone https://github.com/<your-username>/MATLAB-Interpolation-Tool.git
		cd MATLAB-Interpolation-Tool
		```
	2. **Open the Script**
		- Open `interpolation_tool.m` in MATLAB or VS Code.
	3. **Run the Script**
		- Press **Run** in MATLAB
		- **OR** use terminal:
		  ```sh
		  matlab -nosplash -nodesktop -r "run('interpolation_tool.m');"
		  ```

	## Demo Example

	**Input**

	Sample data points:

	```matlab
	x = [300 320 340 360 380 400];      % Temperature (K)

	xi = 350;                           % Temperature to estimate
	```

	When prompted, choose method = 5 (Cubic Spline).

	**Output**

	Console Output:

	```
	--- MATLAB Interpolation Tool ---

	Enter x-data points as a vector: [300 320 340 360 380 400]
	Enter y-data points as a vector: [10.2 12.5 14.8 17.3 20.1 23]
	Enter the value of x to estimate: 350
	Choose interpolation method:
	1. Linear
	2. Polynomial
	3. Lagrange
	4. Newton Divided Difference
	5. Cubic Spline
	Enter your choice: 5

	Estimated value at x = 350 is y = 16.05 kJ/mol
	```

	**Graphical Output:**

	- Blue circles → original data points
	- Red curve → smooth cubic spline interpolation
	- Green square → estimated point

	## Example Use Cases

	- Estimate enthalpy at unmeasured temperatures
	- Approximate reaction rates between measured concentrations
	- Predict density or viscosity from tabulated experimental data

	## Sample Dataset

	| Temperature (K) | Enthalpy (kJ/mol) |
	|-----------------|-------------------|
	| 300             | 10.2              |
	| 320             | 12.5              |
	| 340             | 14.8              |
	| 360             | 17.3              |
	| 380             | 20.1              |
	| 400             | 23.0              |

	## Demo Screenshot

	(Include a sample plot when you run the script and take a screenshot.)
Red curve → smooth cubic spline interpolation

Green square → estimated point

Example Use Cases

Estimate enthalpy at unmeasured temperatures.

Approximate reaction rates between measured concentrations.

Predict density or viscosity from tabulated experimental data.

Sample Dataset
Temperature (K)	Enthalpy (kJ/mol)
300	10.2
320	12.5
340	14.8
360	17.3
380	20.1
400	23.0
