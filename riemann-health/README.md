# Docker container for riemann-health

This image contains a patched libprocps.so that expects the `/proc` filesystem at `/host/proc`. This
allows to report host health by mounting the host `/proc` to the containers `/host/proc` like this:

```
docker run -v /proc:/host/proc:ro jrudolph/riemann-health -h <riemann-host> ...
```

The library was built from procps-3.3.9 by replacing `proc/readproc.c` with the one in this directory.

The license for this file is this:

```
New Interface to Process Table -- PROCTAB Stream (a la Directory streams)
Copyright (C) 1996 Charles L. Blake.
Copyright (C) 1998 Michael K. Johnson
Copyright 1998-2003 Albert Cahalan
This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.
This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.
You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
```