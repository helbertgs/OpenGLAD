# Changelog

All notable changes to OpenGLAD will be documented in this file.

The format is based on Keep a Changelog and this project adheres to Semantic Versioning.

---

## [1.0.0] - 2026-06-30

### Added
•⁠  ⁠Initial release of `OpenGLAD`
•⁠  ⁠Integration of [GLAD 2.0.8](https://github.com/dav1dde/glad) generated `OpenGL` loader
•⁠  ⁠Support for `OpenGL` function loading via C backend
•⁠  ⁠Swift Package Manager compatibility
•⁠  ⁠Clang module map for `C/Swift` interoperability
•⁠  ⁠Cross-platform support for:
  - macOS
  - Linux
  - Windows
•⁠  ⁠Clean package structure for embedding in Swift projects

### Notes

This release establishes the first stable API surface for `OpenGLAD`.  
The project is intended as a low-level dependency for graphics frameworks such as [OpenGLFW](https://github.com/helbertgs/OpenGLFW) and [OpenSpatial](https://github.com/helbertgs/OpenSpatial).

### Future Work

•⁠  ⁠Expand `GLAD` generation support (`OpenGL ES`, `Vulkan`)
•⁠  ⁠Improve documentation via `DocC`
•⁠  ⁠Add CI-based validation of generated bindings
•⁠  ⁠Introduce versioned generator configurations