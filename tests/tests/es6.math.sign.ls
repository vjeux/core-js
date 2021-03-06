{module, test} = QUnit
module \ES6
# Returns the sign of the x, indicating whether x is positive, negative or zero.
test 'Math.sign' (assert)->
  sameValue = (a, b, c)-> assert.ok (if a is b => a isnt 0 or 1 / a is 1 / b else a !~= a and b !~= b), c
  {sign} = Math
  assert.ok typeof! sign is \Function, 'is function'
  assert.strictEqual sign.name, \sign, 'name is "sign"'
  assert.strictEqual sign.length, 1, 'arity is 1'
  assert.ok /native code/.test(sign), 'looks like native'
  sameValue sign(NaN), NaN
  sameValue sign!, NaN
  sameValue sign(-0), -0
  sameValue sign(0), 0
  assert.strictEqual sign(Infinity), 1
  assert.strictEqual sign(-Infinity), -1
  assert.strictEqual sign(16~2fffffffffffff), 1
  assert.strictEqual sign(-16~2fffffffffffff), -1
  assert.strictEqual sign(42.5), 1
  assert.strictEqual sign(-42.5), -1