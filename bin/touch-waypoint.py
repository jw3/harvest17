#!/usr/bin/env python



import struct
import sys

import requests
from requests.auth import HTTPDigestAuth

#
# for now these are hardcoded
#
cam_host = "cam1"
input_source = "event2"
buffer_size = 60
username = "admin"
password = "password"

#

FORMAT = 'llhhI'
EVENT_SIZE = struct.calcsize(FORMAT)

infile = open('/dev/input/{}'.format(input_source), 'rb')
url_template = "http://{}/cgi-bin/ptz.cgi?action=start&channel=1&code=GotoPreset&arg1=0&arg2={}&arg3=0"


def is_abs(x): return x == 3


def is_coord(x): return x == 0 or c == 1


def is_y(x): return True if x else False


def y_to_pre(x): return 1 if x < buffer_size else 2 if x > 480 - buffer_size else 0


event = infile.read(EVENT_SIZE)
while event:
    (s, u, t, c, v) = struct.unpack(FORMAT, event)
    if is_abs(t) and is_coord(c):
        plane = "y" if c else "x"
        print "click @ %s %d" % (plane, v)
        if is_y(v):
            preset = y_to_pre(v)
            if preset:
                try:
                    url = url_template.format(cam_host, preset)
                    print url
                    requests.get(url, auth=HTTPDigestAuth(username, password))
                except:
                    print "failed to set %d on %s" % (preset, cam_host)

    event = infile.read(EVENT_SIZE)

infile.close()
