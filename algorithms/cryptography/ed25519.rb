require 'openssl'

# Port of http://ed25519.cr.yp.to/python/ed25519.py

@b = 256
@q = 2**255 - 19
@l = 2**252 + 27742317777372353535851937790883648493

def H(m)
  OpenSSL::Digest::SHA512.digest(m)
end

def expmod(b,e,m)
  return 1 if e == 0
  t = expmod(b,e/2,m)**2 % m
  t = (t*b) % m if e & 1 != 0
  return t
end

def inv(x)
  expmod(x,@q-2,@q)
end

@d = -121665 * inv(121666)
@I = expmod(2,(@q-1)/4,@q)

def xrecover(y)
  xx = (y*y-1) * inv(@d*y*y+1)
  x = expmod(xx,(@q+3)/8,@q)
  x = (x*@I) % @q if (x*x - xx) % @q != 0
  x = @q-x if x % 2 != 0
  x
end

@By = 4 * inv(5)
@Bx = xrecover(@By)
@B = [@Bx % @q,@By % @q]

def edwards(_P,_Q)
  x1 = _P[0]
  y1 = _P[1]
  x2 = _Q[0]
  y2 = _Q[1]
  x3 = (x1*y2+x2*y1) * inv(1+@d*x1*x2*y1*y2)
  y3 = (y1*y2+x1*x2) * inv(1-@d*x1*x2*y1*y2)
  return [x3 % @q,y3 % @q]
end

def scalarmult(_P,e)
  return [0,1] if e == 0
  _Q = scalarmult(_P,e/2)
  _Q = edwards(_Q,_Q)
  _Q = edwards(_Q,_P) if e & 1 != 0
  return _Q
end

def encodeint(y)
  bits = (0...@b).map{ |i| (y >> i) & 1}
  (0...@b/8).map{ |i|(0...8).map { |j| bits[i * 8 + j] << j}.sum.chr }.join
end

def encodepoint(_P)
  x = _P[0]
  y = _P[1]
  bits = (0...@b-1).map{|i| (y >> i ) & 1}.concat([x & 1])
  (0...@b/8).map {|i|(0...8).map {|j| bits[i * 8 + j] << j}.sum.chr }.join
end

def bit(h,i)
  ((h[i/8]).ord >> (i%8)) & 1
end

def publickey(sk)
  h = H(sk)
  a = 2**(@b-2) + (3...@b-2).map{|i| 2**i * bit(h,i)}.sum
  _A = scalarmult(@B,a)
  encodepoint(_A)
end

def Hint(m)
  h = H(m)
  (0...2*@b).map {|i| 2**i * bit(h,i)}.sum
end

def signature(m,sk,pk)
  h = H(sk)
  a = 2**(@b-2) + (3...@b-2).map{|i| 2**i * bit(h,i)}.sum
  r = Hint((@b/8...@b/4).map { |i| h[i]}.join + m)
  _R = scalarmult(@B,r)
  _S = (r + Hint(encodepoint(_R) + pk + m) * a) % @l
  encodepoint(_R) + encodeint(_S)
end

def isoncurve(_P)
  x = _P[0]
  y = _P[1]
  (-x*x + y*y - 1 - @d*x*x*y*y) % @q == 0
end

def decodeint(s)
  (0...@b).map{|i| 2**i * bit(s,i)}.sum
end

def decodepoint(s)
  y = (0...@b-1).map{|i| 2**i * bit(s,i)}.sum
  x = xrecover(y)
  x = @q - x if x & 1 != bit(s,@b-1)
  _P = [x,y]
  raise ArgumentError, "decoding point that is not on curve" unless isoncurve(_P)
  _P
end

def checkvalid(s,m,pk)
  raise ArgumentError, "signature length is wrong" if s.length != @b/4
  raise ArgumentError, "public-key length is wrong "if pk.length != @b/8
  _R = decodepoint(s[0..@b/8])
  _A = decodepoint(pk)
  _S = decodeint(s[@b/8..@b/4])
  h = Hint(encodepoint(_R) + pk + m)
  raise "Signature does not pass verifiction" if scalarmult(@B,_S) != edwards(_R,scalarmult(_A,h))
end
