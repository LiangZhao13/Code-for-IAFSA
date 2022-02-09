# Improved-Artificial-Fish-Swarm-Algorithm
This is the MATLAB code for Improved Artificial Fish Swarm Algorithm (IAFSA). The code is used for global path planning of autonomous surface vessels.\
The mathematical background of IAFSA is detailed descriped in the author's article:  
`Liang Zhao, Yong Bai*. 2022. Route Planning for Autonomous Vessels based on Improved Artificial Fish Swarm Algorithm. Submitted to Ships and Offshore Structures.`\
The manuscript of the article is uploaded [here](/article/Manuscript.pdf).
## Files
- [improveAF_main](/improvedAF_main.m): m file. The main function of the algorithm. The function starts with the reading of the environment map and returns the x/y coordinates and yaw angle of the planned waypoints.
- [GridAF_prey](/GridAF_prey.m): m file. The modified prey behavior of the artificial fish. The directional operator and probability weight factor are included here.
- [GridAF_follow](/GridAF_follow.m): m file. The artificial fish will follow its neighbor which is with the best food consisitency.
- [GridAF_swarm](/GridAF_swarm.m): m file
