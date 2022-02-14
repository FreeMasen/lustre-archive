local close = require "lustre.frame.close"
local CloseCode = close.CloseCode
local CloseFrame = close.CloseFrame
local utils = require "spec.utils"

describe("close", function()
  describe("CloseCode", function()
    describe("constructors", function()
      it("normal", function()
        local cc = CloseCode.normal()
        assert.are(cc.type, "normal")
        assert.are(cc.value, 1000)
      end)
      it("away", function()
        local cc = CloseCode.away()
        assert.are(cc.type, "away")
        assert.are(cc.value, 1001)
      end)
      it("protocol", function()
        local cc = CloseCode.protocol()
        assert.are(cc.type, "protocol")
        assert.are(cc.value, 1002)
      end)
      it("unsupported", function()
        local cc = CloseCode.unsupported()
        assert.are(cc.type, "unsupported")
        assert.are(cc.value, 1003)
      end)
      it("status", function()
        local cc = CloseCode.status()
        assert.are(cc.type, "status")
        assert.are(cc.value, 1005)
      end)
      it("abnormal", function()
        local cc = CloseCode.abnormal()
        assert.are(cc.type, "abnormal")
        assert.are(cc.value, 1006)
      end)
      it("invalid", function()
        local cc = CloseCode.invalid()
        assert.are(cc.type, "invalid")
        assert.are(cc.value, 1007)
      end)
      it("policy", function()
        local cc = CloseCode.policy()
        assert.are(cc.type, "policy")
        assert.are(cc.value, 1008)
      end)
      it("size", function()
        local cc = CloseCode.size()
        assert.are(cc.type, "size")
        assert.are(cc.value, 1009)
      end)
      it("extension", function()
        local cc = CloseCode.extension()
        assert.are(cc.type, "extension")
        assert.are(cc.value, 1010)
      end)
      it("error", function()
        local cc = CloseCode.error()
        assert.are(cc.type, "error")
        assert.are(cc.value, 1011)
      end)
      it("restart", function()
        local cc = CloseCode.restart()
        assert.are(cc.type, "restart")
        assert.are(cc.value, 1012)
      end)
      it("again", function()
        local cc = CloseCode.again()
        assert.are(cc.type, "again")
        assert.are(cc.value, 1013)
      end)
      it("tls", function()
        local cc = CloseCode.tls()
        assert.are(cc.type, "tls")
        assert.are(cc.value, 1015)
      end)
      it("decode/encode reserved", function()
        for i = 1016, 2999 do
          local bytes = string.char(i >> 8, i & 255)
          local cc = CloseCode.decode(bytes)
          assert.are(cc.value, i)
          assert.are(cc.type, "reserved")
          assert.are(cc:encode(), bytes)
        end
      end)
      it("decode/encode iana", function()
        for i = 3000, 3999 do
          local bytes = string.char(i >> 8, i & 255)
          local cc = CloseCode.decode(bytes)
          assert.are(cc.value, i)
          assert.are(cc.type, "iana")
          assert.are(cc:encode(), bytes)
        end
      end)
      it("decode/encode library", function()
        for i = 4000, 4999 do
          local bytes = string.char(i >> 8, i & 255)
          local cc = CloseCode.decode(bytes)
          assert.are(cc.value, i)
          assert.are(cc.type, "library")
          assert.are(cc:encode(), bytes)
        end
      end)
    end)
  end)
  describe("CloseFrame", function()
    it("encode/decode", function()
      local bytes = string.char(0, 0) .. "asdf"
      local cf = assert(CloseFrame.decode(bytes))
      assert.are(cf:encode(), bytes)
    end)
  end)
end)
