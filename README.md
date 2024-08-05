# Flutter web builder image

## Publishing a new flutter version image
In order to publish a new version of the flutter builder, simply push a new tag to git with the version of flutter you'd like:

```sh
git tag -a 3.22.2 -m "Flutter v3.22.2"
git push origin --tags
```


## Note: This should not be used for a base image in production, only for building releases.