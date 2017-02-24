multiHashing = require('unomp-multi-hashing')
assert = require('assert');

data = new Buffer("7000000001e980924e4e1109230383e66d62945ff8e749903bea4336755c00000000000051928aff1b4d72416173a8c3948159a09a73ac3bb556aa6bfbcad1a85da7f4c1d13350531e24031b939b9e2b", "hex")

describe 'algorithms', ->
  describe 'quark', ->
    it 'returns right hash', ->
      expected = new Buffer('c648b4153cd81052583542367ae3408e44989023080bba2d60cc209ed04c8f3c', 'hex')
      assert.deepEqual(expected, multiHashing['quark'](data))

  describe 'neoscrypt', ->
    it 'returns right hash', ->
      expected = new Buffer('94367f3f5b4d60e0021e5b73f645003ebfd410b0f67f7be9f21367a02d6897ae', 'hex')
      multiplier = Math.pow(2, 16)
      assert.deepEqual(expected, multiHashing['neoscrypt'](data, multiplier))
