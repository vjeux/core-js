{module, test} = QUnit
module \ES6
# Returns an implementation-dependent approximation to the cube root of x.
test 'Math.cbrt' (assert)->
  epsilon = (a, b, E)-> Math.abs(a - b) <= if E? => E else 1e-11
  sameValue = (a, b, c)-> assert.ok (if a is b => a isnt 0 or 1 / a is 1 / b else a !~= a and b !~= b), c
  {cbrt} = Math
  assert.ok typeof! cbrt is \Function, 'is function'
  assert.strictEqual cbrt.name, \cbrt, 'name is "cbrt"'
  assert.strictEqual cbrt.length, 1, 'arity is 1'
  assert.ok /native code/.test(cbrt), 'looks like native'
  sameValue cbrt(NaN), NaN
  sameValue cbrt(0), 0
  sameValue cbrt(-0), -0
  assert.strictEqual cbrt(Infinity), Infinity
  assert.strictEqual cbrt(-Infinity), -Infinity
  assert.strictEqual cbrt(-8), -2
  assert.strictEqual cbrt(8), 2
  assert.ok epsilon cbrt(-1000), -10 # O_o
  assert.ok epsilon cbrt(1000), 10   # O_o