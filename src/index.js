const express = require('express');
const Redis = require('ioredis');

const redis = new Redis('6379', 'redis');

redis.on('connect', () => {
  express().use((_, res) => {
    redis.incr('visits').then(
      visits => res.end({ visits }),
      error => res.status(500).end(error),
    );
  }).listen(8888);
});
