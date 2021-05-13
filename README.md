# 2d-diffusion-solver
V3 is final versions of code turned in for project

CODE USE
solverinputs
  Prompts user for all the required inputs
  1.X: Single side dimension of the total matrix of material
    Requires square dimensions
  2. Number of different materials
  3. Upper left and lower right corners for each material
     a. This is required so I can build the materials. It limits users to only rectangular sections material
        as long the total dimensions of materials in the x and y directions fit into X
        b. It is important to note that these dimensions are input as matrix indices. e.g. the upper right corner always
        has x value of 1 and y value of 1
  4. Absorption for that material (must be positive)
  5. Diffusion for that material (must be positive)
  6. Source inputs with same requirements as in steps 2 and 3
    
dif_solver
  1. Takes in values from solverinputs and calls on array_builder and gs_solver.
    a. Takes returned matrix from gs_solver and maps it on surf plot
    
array_builder
  1. Takes in diffusion and absorption matrices, calls on ceofficent calculators for a certain point, and returns
  the operating matrix which is diagonalized in gs_solver.
  
gs_solver
  1. Takes in the coefficients matrix from array_builder
  2. Separates into diagonal components and builds L and U 
  3. Carries out GS itteration with those matrices and solves for flux at each point in the mesh
  4. Returns matrix of original dimension X as given by user input in solverinputs with values
     of flux at each point to be plotted on surf plot in dif_solver.
