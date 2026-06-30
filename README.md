# OpenGLAD

OpenGLAD is a cross-platform Swift Package that wraps [GLAD 2](https://github.com/dav1dde/glad), the `OpenGL` function loader, providing `C/Swift` interoperability through a `Clang` module map.

It is designed to be used in conjunction with an external `OpenGL` context manager such as [OpenGLFW](https://github.com/helbertgs/OpenGLFW).

---

## Features

- `OpenGL` function loader generated via `GLAD 2`
- `C/Swift` interoperability via module map
- Cross-platform support (`Windows`, `Linux`, `macOS`)
- Generated from [GLAD 2.0.8](https://gen.glad.sh/#generator=c&api=gl%3D3.3&profile=gl%3Dcore%2Cgles1%3Dcommon&extensions=GL_ARB_debug_output%2CGL_EXT_texture_compression_s3tc%2CGL_EXT_texture_filter_anisotropic%2CGL_KHR_debug&options=LOADER)
- Designed for external context management

---

## Requirements

| Tool  | Version        |
|-------|---------------|
| Swift | 6.0+          |
| OS    | macOS 13+, Ubuntu 22.04+, Windows 10+ |

---

## Installation

Add the package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/helbertgs/OpenGLAD.git", from: "1.0.0")
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["OpenGLAD"]
    )
]
```

## Usage

1. Initialize the loader

Initialize `GLAD` after an `OpenGL` context has been created.
```swift
import OpenGLAD

gladLoaderLoadGL()
```

The exact loader function is provided by the generated [GLAD 2](https://github.com/dav1dde/glad) sources.

2. Use OpenGL functions

All `gl*` functions and `GL_*` constants become available after initialization.
```swift
glad_glClearColor(0.2, 0.3, 0.3, 1.0)
glad_glClear(GLenum(GL_COLOR_BUFFER_BIT))
glad_glDrawArrays(GLenum(GL_TRIANGLES), 0, 3)
```

3. Unload (optional)

Release function pointers before destroying the context.
```swift
gladLoaderUnloadGL()
```

## Concurrency

`OpenGL` requires that all `gl*` calls are executed on the same thread that owns the active context.
In Swift 6 environments, a common pattern is to confine rendering to `@MainActor` when the context is bound to the main thread:

```swift
@MainActor
final class Renderer {
    func setup() {
        gladLoaderLoadGL()
    }

    func render() {
        glClear(GLenum(GL_COLOR_BUFFER_BIT))
    }

    deinit {
        gladLoaderUnloadGL()
    }
}
```

## Project Structure

```
OpenGLAD
└── Sources
    └── OpenGLAD
        ├── include
        │   ├── module.modulemap
        │   ├── glad
        │   │   ├── gl.h
        │   └── khr
        │       └── khrplatform.h
        │
        └── src
            └── khrplatform.h
```


## License

This package is licensed under the [MIT License](LICENSE).
The bundled [GLAD 2](https://github.com/dav1dde/glad) sources are generated code from [GLAD 2](https://gen.glad.sh/#generator=c&api=gl%3D3.3&profile=gl%3Dcore%2Cgles1%3Dcommon&extensions=GL_ARB_debug_output%2CGL_EXT_texture_compression_s3tc%2CGL_EXT_texture_filter_anisotropic%2CGL_KHR_debug&options=LOADER) and follow the licensing terms defined by the generator configuration.