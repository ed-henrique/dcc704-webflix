#!/bin/sh

# Run both commands in the background
yarn run dev &
yarn run stripe:listen &

# Wait for both commands to finish
wait
