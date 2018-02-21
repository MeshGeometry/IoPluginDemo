# IoPluginDemo
Base project for making your own IOGRAM plugins.

# Windows

```git clone https://github.com/MeshGeometry/IoPluginDemo.git --recursive```

```./build_vs2017.bat```

Then, copy DLL `Build/bin/MyPluging.dll` to `IOGRAM_EXE_DIR/Data/Plugins`. Make sure these folders are directly visible to IOGRAM (i.e symlinks will crash).
