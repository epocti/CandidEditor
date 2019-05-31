![header](https://raw.githubusercontent.com/kokoscript/CandidEditor/master/assets/logo-header.png)
## An OpenFL-based, crossplatform image editing tool

*Note: It is generous to say that Candid Editor is in an alpha state. Many features are currently unimplemented, several issues exist within the project that may go unrectified for a while, and breaking refactors may occur at any time. Use in production at your own risk.*

Candid Editor is designed to be a simple-to-use, yet powerful-when-needed image editor. Editor is not designed for a specific task, such as digital painting, photo re-touching, or asset creation - rather, the goal of Editor is to provide a simple way to accomplish multiple types of workloads.

Current key features include:
* A custom, lightweight UI framework with support for virtual windows, dubbed "lithium"
* Simple brush tool
* Dual-color system with RGB sliders for modification
* Pan-and-zoomable canvas - Pan using the MMB or the "Paw" tool, zoom using the scroll wheel

Not yet implemented:
* New Canvas dialog. This is currently being worked on and will be created on startup, however the program will still function regardless of its creation. To disable it for now, simply remove `addChild(Common.newCanvasWindow);` from `Main.hx`.
* Pretty much any tool that isn't the Brush or Paw Tool (unimplemented tools appear in the tools window as placeholders for now)
* Save, Save As, and Open actions (the icons are there, and the buttons will bring up a file dialog, however these are not linked to anything else for now)

## Building
(These instructions assume that you are new to the Haxe scene, so they may seem a little redundant for some.)

Editor depends on the latest versions of OpenFL and Lime. To install these, run `haxelib install openfl` and `haxelib install lime`. Afterwards, run `haxelib run lime setup` and `haxelib run openfl setup` to make sure the commandline tools as well as any extra dependencies for the two are installed.

To build and run Editor from source, `cd` to the root of the project (where `project.xml` is located) and run the command that corresponds to your platform:
* `lime test macos` - requires that you have Xcode installed
* `lime test linux` - requires that you have g++ installed
* `lime test windows` - requires that you have Visual Studio installed with C++/Win32 support

You can also achieve a faster compile time at the cost of performance by running `lime test neko`. Additionally, substitute `test` with `build` for the above commands to build without running afterward.
