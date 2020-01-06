# AUR Build Action

This takes a container definition for building AUR based packages and
generates a pacman installable tarball based on the package definition
provided.

## Inputs

* `path` - relative to the root of your workspace for where to build from,
  this should contain the target `PKGBUILD` file and any additional files
  for building

## Outputs

* `pkg_path` - path in the workspace for the built `.pkg.tar.xz` file
* `pkg_name` - base name for the package built if you want to preserve it

## Example usage

```yaml
steps:
   - name: checkout
     uses: actions/checkout@v1
   - name: build
     uses: jdost/aur@action
     with:
       path: 'my-pkg-folder'
   - name: upload
     uses: action/upload@master
     with:
       name: ${{ steps.build.outputs.pkg_name }}
       path: ${{ steps.build.outputs.pkg_path }}
```
