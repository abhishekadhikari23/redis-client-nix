#!/usr/bin/env python3

import redis
from time import sleep
r = redis.Redis(host='localhost', port=6379, db=0)
val = 0
if r.get('val') == None:
    val = 0
else:
    val = int(r.get('val').decode())

while True:
    r.set('val', val)
    val += 1
    sleep(1)
#print(r.get('val'))
#r.set('foo', 'bar')
#print(r.get('foo'))
