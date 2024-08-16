# Shutter Keyper Deployment Assets

This repo helps with generating assets docker images for Keyper deployment.

To create a new assets definition make a copy of the `_template` directory.
The name should be identical to the shuttermint `CHAIN_ID` parameter in the 
genesis file (for example `shutter-gnosis-1000`).

Place an appropriate shuttermint genesis folder in the `genesis` directory 
and insert any required variables into `variables.env`.

`rolling-shutter chain init --blocktime 10 --genesis-keyper 0x440Dc6F164e9241F04d282215ceF2780cd0B755e --role validator --root genesis`

Then run `./build.sh <target-dir> <tag>` to build the docker image.

The default image base name is `ghcr.io/shutter-network/assets`.
To override set the `IMAGE_NAME` environment variable.

The resulting docker image will be tagged as `<IMAGE_NAME>:<TARGET>-<TAG>`.
