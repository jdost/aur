# AUR Build Action

This takes a container definition for building AUR based packages and
generates a pacman installable tarball based on the package definition
provided.

## Inputs

* `path` - relative to the root of your workspace for where to build from,
  this should contain the target `PKGBUILD` file and any additional files
  for building

## Outputs

* `package` - path in the workspace for the built `.pkg.tar.xz` file

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
       name: ${{ steps.build.outputs.name }}
       path: ${{ steps.build.outputs.path }}
```
