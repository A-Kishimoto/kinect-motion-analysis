# Analysis Programs of Kinect-Based Motion Data for MATLAB (Windows 11 & NVIDIA, with KinZ-Matlab) (Work in Progress)
These programs were developed for analyzing kinect-based motion data recorded by Azure Kinect and MATLAB with [KinZ-Matlab](https://github.com/jrterven/KinZ-Matlab) (by J.Treven) in my work.  
In These Programs, there are 2 types of analyzing motion data: The time series graph of motion activity & the count of most shifting joint in
each frame (using motion activity).

## Preparation for Analizing Kinect-Based Motion Data

### Installation of SDK
To use Azure Kinect, Several SDKs are needed to be installed.  
1. CUDA (For NVIDIA) ([*Download CUDA*](https://developer.nvidia.com/cuda-downloads?/))  
**CUDA** is needed if you have yet to install. 
2. Azure Kinect SDK ([*Download Azure Kinect SDK*](https://github.com/microsoft/Azure-Kinect-Sensor-SDK/blob/develop/docs/usage.md))  
It is not necessary to install the newest version of SDK. Please check your computer's compatibility with the version of SDK (In this case, the version is 1.4.1.).  
3. Azure Kinect Body Tracking SDK ([*Download Azure Kinect Body Tracking SDK*](https://learn.microsoft.com/en-us/azure/kinect-dk/body-sdk-download))  
Same as Azure Kinect SDK, it is not necessary to install the newest version of SDK. Please check your computer's compatibility with the version of SDK (In this case, the version is 1.1.2.).  
4. Setting up Path Environmental Variables  
Directries of **k4a.dll** (normally, included in *C:\Program Files\Azure Kinect SDK v*(your version number)*\tools*) and **k4abt.dll** (normally, included in *C:\Program Files\Azure Kinect Body Tracking SDK\tools*) are needed to be added to path environmental variables.  

### Installation and Modification of KinZ-Matlab
1. KinZ-Matlab ([*Download KinZ-Matlab*](https://github.com/jrterven/KinZ-Matlab))

2. Modifying bodyTrackingDemo.m  

## Analysis of Kinect-Based Motion Data

### MotionActivityExporter.m

### MotionActivityTimeAxisIntegrator.m

### MotionActivityPlot.m

### MotionActivityCounter.m

### MotionActivityCountMean.m

