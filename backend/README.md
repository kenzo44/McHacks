# Backend System running Lapis
## Never used Lapis?
All you need to do is to install openresty, then run two commands.

[**Click here for OpenResty installation instructions.**](https://openresty.org/en/installation.html)

Once you have openresty installed, simply run the following commands:

```
sudo apt-get install luarocks # Or your OS' equivalent
```

```
luarocks install lapis
```

## Running the backend
This is built for a PostGres database. There are specific requirements for the
database. These requirements will be listed at a later time (or displayed with
a database dump instead).

Once you have the database set up, you can simply run `lapis server dev`. This
will start the backend.

## Endpoints
The endpoints are documented at [this link](https://docs.google.com/spreadsheets/d/1NWtizQ-U5brhXDa7yj_1zKHmL3zWmk7eJ_C0iLE4qPo/edit#gid=0). Endpoints listed in manilla are subject to change before version
1.0.0. Endpoints which are "Grayed Out" are to be removed (or are already
removed)
