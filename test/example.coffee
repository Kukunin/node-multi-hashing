multiHashing = require('../build/Release/multihashing')
assert = require('assert');

describe 'algorithms', ->
  beforeEach -> @data = new Buffer("7000000001e980924e4e1109230383e66d62945ff8e749903bea4336755c00000000000051928aff1b4d72416173a8c3948159a09a73ac3bb556aa6bfbcad1a85da7f4c1d13350531e24031b939b9e2b", "hex")

  describe 'quark', ->
    it 'returns right hash', ->
      expected = new Buffer('c648b4153cd81052583542367ae3408e44989023080bba2d60cc209ed04c8f3c', 'hex')
      assert.deepEqual(expected, multiHashing['quark'](@data))

  describe 'cryptonight', ->
    it 'returns right hash', ->
      expected = new Buffer('e97ef3fc036d67626e54547a71307303dc5fa89b9df499feeaef9d11acadbe9b', 'hex')
      assert.deepEqual(expected, multiHashing['cryptonight'](@data))

  describe 'cryptolight', ->
    it 'returns right hash', ->
      expected = new Buffer('f501e0d0c78890bd07926aa8a126c4f2a6724ff18282c101616112e0294659b9', 'hex')
      assert.deepEqual(expected, multiHashing['cryptolight'](@data))

  describe 'neoscrypt', ->
    it 'returns right hash', ->
      expected = new Buffer('94367f3f5b4d60e0021e5b73f645003ebfd410b0f67f7be9f21367a02d6897ae', 'hex')
      ntime = 1488111661
      assert.deepEqual(expected, multiHashing['neoscrypt'](@data, ntime))

    context 'with real data', ->
      beforeEach -> @data = new Buffer("020000009f3e88a39432fde86da4887efe05c0dfb2cf1d3efcf7bcefd8848358bc5613715f96a64bdd88745fd68e061b4ceb9e6b8f9741e348443baa7a6a34b8fbd6d89ee3dbb2581d44201c7e250000", "hex")

      it 'does not crash', ->
        ntime = 1488116707
        multiHashing['neoscrypt'](@data, ntime)
