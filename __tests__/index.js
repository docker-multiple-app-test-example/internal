const request = require('request-promise');

const internal = `http://internal:8888`;

describe('should work', () => {
  test('should response with valid json', () =>
    request({ uri: internal, json: true }).then(json => {
      expect(json).toHaveProperty('visits');
    })
  );
});
