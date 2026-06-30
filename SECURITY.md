# Security Policy

## Supported Versions

| Version | Supported |
|--------|-----------|
| main   | Yes       |

## Reporting a Vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Please report security issues by emailing:

**hellbert.gomes@gmail.com**

Include the following in your report:

- A description of the vulnerability
- Steps to reproduce or a proof-of-concept
- The potential impact
- Any suggested fix (if available)

You can expect an acknowledgment within **72 hours**.

Resolution timelines vary depending on severity and complexity.

## Scope

This library is a thin wrapper around GLAD 2-generated C code for loading OpenGL function pointers. Security-relevant areas include:

- Lifecycle of the loader (`gladLoaderLoadGL` / `gladLoaderUnloadGL`)
- Function pointer resolution via platform-specific loader (e.g. `dlopen`, `GetProcAddress`)
- OpenGL context validity during initialization and usage
- Interaction with shader compilation APIs (`glShaderSource`, `glCompileShader`), which are handled by the graphics driver

## Out of Scope

- OpenGL driver or GPU firmware vulnerabilities
- Issues in GLAD 2 itself (report upstream: https://github.com/Dav1dde/glad)
- Issues in OpenGLFW or other context managers