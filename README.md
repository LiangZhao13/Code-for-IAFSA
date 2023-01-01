# Improved-Artificial-Fish-Swarm-Algorithm
## Description
This is the MATLAB code for Improved Artificial Fish Swarm Algorithm (IAFSA). The code is used for global path planning of autonomous surface vessels.\
The mathematical background of IAFSA is detailed descriped in the author's article:  
`Liang Zhao, Yong Bai*, Fang Wang. 2022. Route Planning for Autonomous Vessels based on Improved Artificial Fish Swarm Algorithm. Ships and Offshore Structures.`\
## Files
### Main Function
- [IAFSA](/IAFSA.m): m file. The main function of the algorithm. The function starts with the reading of the environment map and returns the x/y coordinates and yaw angle of the planned waypoints.
- [GridAF_prey](/GridAF_prey.m): m file. The modified prey behavior of the artificial fish. The directional operator and probability weight factor are included here.
- [GridAF_follow](/GridAF_follow.m): m file. The artificial fish will follow its neighbor which is with the best food consisitency. See the figure below.
![image](https://github.com/LiangZhao13/Improved-Artificial-Fish-Swarm-Algorithm/blob/main/images/behavior%E5%89%AF%E6%9C%AC.jpg)
- [GridAF_swarm](/GridAF_swarm.m): m file. The artificial fish will take a step in the direction of the swarm center. See the figure below.
![image](https://github.com/LiangZhao13/Improved-Artificial-Fish-Swarm-Algorithm/blob/main/images/swarmbehavior%E7%9A%84%E5%89%AF%E6%9C%AC.png)
### Additional Function
- [image_process](/image_process.m): m file. Read and process the environment map. Recognize the RGB color of the obstacles and ocean and convert the map into binary matrix. 
- [allow_fun](/allow_fun.m): m file. Calculate the allowable area in the neighborhood.
- [eachAF_dist](/eachAF_dist.m): m file. Calculate the distance between each artificial fish. 
- [arr2orxy](/arr2orxy.m): m file. Convert array structure into xy coordinates. 
- [distance](/distance.m): m file. Calculate the distance between 2 artificial fish.
## Running Results
![image](https://github.com/LiangZhao13/Improved-Artificial-Fish-Swarm-Algorithm/blob/main/images/Satellite_map.png)
![image](https://github.com/LiangZhao13/Improved-Artificial-Fish-Swarm-Algorithm/blob/main/images/map_with_route.png)
## Contact
Liang Zhao: [liamzhao13@zju.edu.cn](liamzhao13@zju.edu.cn). 
