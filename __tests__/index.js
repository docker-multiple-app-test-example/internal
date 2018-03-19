const request = require('request-promise');
const Redis = require('ioredis');

const internal = `http://internal:8888`;
const redis = new Redis('6379', 'redis');

beforeAll(() => new Promise(res => redis.on('ready', res)));
afterAll(() => redis.quit());

describe('should work', () => {
  test('should response with valid json', () =>
    request({ uri: internal, json: true }).then(json =>
      expect(json).toHaveProperty('visits')
    )
  );

  test('should increment counter after request', () =>
    redis.get('visits').then(beforeRequest =>
      request({ uri: internal, json: true }).then(() =>
        redis.get('visits').then(afterRequest =>
          expect(afterRequest - beforeRequest).toBe(1)
        )
      )
    )
  )
});
