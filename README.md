# Analysis Programs of Kinect-Based Motion Data for MATLAB (Windows 11 & NVIDIA, with KinZ-Matlab) (Work in Progress)
These programs were developed for analyzing kinect-based motion data recorded by Azure Kinect and MATLAB with [KinZ-Matlab](https://github.com/jrterven/KinZ-Matlab) (by J.Treven) in my work.  
In These Programs, there are 2 types of analyzing motion data: **The time series graph of motion activity** and **the count of most shifting joint in
each frame (using motion activity)**.

## Preparation for Analizing Kinect-Based Motion Data

### Installation of SDK
To use Azure Kinect, Several SDKs are needed to be installed.  

**1. CUDA (For NVIDIA)** ([*Download CUDA*](https://developer.nvidia.com/cuda-downloads?/))  
  - CUDA is needed if you have yet to install.

**2. Azure Kinect SDK** ([*Download Azure Kinect SDK*](https://github.com/microsoft/Azure-Kinect-Sensor-SDK/blob/develop/docs/usage.md))  
  - Please check your computer's compatibility with the version of SDK (In this case, the version is 1.4.1.).  

**3. Azure Kinect Body Tracking SDK** ([*Download Azure Kinect Body Tracking SDK*](https://learn.microsoft.com/en-us/azure/kinect-dk/body-sdk-download))  
  - Please check your computer's compatibility with the version of SDK (In this case, the version is 1.1.2.).  

**4. Setting up Path Environmental Variables**  
  - Directries of **k4a.dll** (normally, included in *C:\Program Files\Azure Kinect SDK v*(your version number)*\tools*) and **k4abt.dll** (normally, included in *C:\Program Files\Azure Kinect Body Tracking SDK\tools*) are needed to be added to path environmental variables.  
  - Restart your computer.  

### Installation and Modification of KinZ-Matlab
**1. MATLAB** ([*Download MATLAB*](https://www.mathworks.com/downloads/))  
  - To install MATLAB, it is necessary to create your MathWorks account.

**2. KinZ-Matlab** ([*Download KinZ-Matlab*](https://github.com/jrterven/KinZ-Matlab))  
  - Set up compiler for C++ by MATLAB.  
```
mex -setup cpp
```
OR  
```
mex -setup CPP
```
OR  
```
mex -setup c++
```
  - Run **compile_for_windows.m** and check whether bodyTrackingDemo.m can run.  
  - You might need to install Image Processing Toolbox plugin if bodyTrackingDemo.m does not work.  
  - If you want to get details, please refer to [*here*](https://github.com/jrterven/KinZ-Matlab).  

**3. Copying & Modifying bodyTrackingDemo.m**  
  - If bodyTrackingDemo.m works, copy bodyTrackingDemo.m and rename (in this case, MotionRecording.m).
  - 

## Analysis of Kinect-Based Motion Data

### MotionActivityExporter.m

### MotionActivityTimeAxisIntegrator.m

### MotionActivityPlot.m

### MotionActivityCounter.m

### MotionActivityCountMean.m

