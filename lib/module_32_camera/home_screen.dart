import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  int _selectedCamera = 0;

  Future<void> _getCameras() async {
    _cameras = await availableCameras();
  }

  @override
  void initState() {
    super.initState();
    _getCameras().then((_) {
     _initializeCameraController();
    });
  }

  void _initializeCameraController () {
    // _cameraController = CameraController(_cameras[0], ResolutionPreset.max);
    _cameraController = CameraController(_cameras[_selectedCamera], ResolutionPreset.max);
    _cameraController?.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void _switchCamera() {
    if(_cameras.length > 1) {
      if (_selectedCamera == 0) {
        _selectedCamera = 1;
      } else {
        _selectedCamera = 0;
      }
      _initializeCameraController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera setup'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body:
          (_cameraController?.value.isInitialized ?? false)
              ? Column(
                children: [
                  Expanded(child: CameraPreview(_cameraController!)),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                            child: Icon(Icons.cameraswitch_rounded),
                            onPressed: () {
                              _switchCamera();
                            }
                        ),

                        FloatingActionButton(
                          child: Icon(Icons.camera),
                            onPressed: () async {
                            XFile? capturedPhoto = await _cameraController?.takePicture();
                            if(capturedPhoto != null){
                              print(capturedPhoto.path);
                            }
                            }
                        ),
                      ],
                    ),
                  )
                ],
              )
              : Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController?.dispose();
  }
}
