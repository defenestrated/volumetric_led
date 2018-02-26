inlets = 1
outlets = 0
autowatch = 1

var deletable = ["jit.scissors", "jit.glue", "outlet", "inlet"]
this.patcher.apply(wrangleextants)

var pinlets = new Array(6)
var scissors = new Array(6)
var glues = new Array(6)
var lastglue = this.patcher.newdefault(this.box.rect[0], this.box.rect[1] + 300, "jit.glue", "@columns", 6)
var outie = this.patcher.newdefault(this.box.rect[0], this.box.rect[1] + 340, "outlet")



function wrangleextants(o) {
  var cmp = this

  deletable.forEach(function(el) {
    if (o.maxclass === el) cmp.patcher.remove(o)
  })
}

for (var i = 0; i < scissors.length; i++) {
  pinlets[i] = this.patcher.newdefault(this.box.rect[0] + i * 150, this.box.rect[1] - 100, "inlet")
  scissors[i] = this.patcher.newdefault(this.box.rect[0] + i * 150, this.box.rect[1] + 30, "jit.scissors", "@columns", 6)
  glues[i] = this.patcher.newdefault(this.box.rect[0] + i * 150, this.box.rect[1] + 90, "jit.glue", "@columns", 6)
}


// connect glue 0 to every scissors out[0]
// connect glue 1 to every scissors out[1]
// etc.

for (var x = 0; x < glues.length; x++) {
  // for each glue
  for (var y = 0; y < scissors.length; y++) {
    // for each of this glue's inlets
      this.patcher.connect(scissors[y], x, glues[x], y)
  }

  // then connect all to the metaglue
  this.patcher.connect(glues[x], 0, lastglue, x)
}

this.patcher.connect(lastglue, 0, outie, 0)

for (var i = 0; i < scissors.length; i++) {
  this.patcher.connect(pinlets[i], 0, scissors[i], 0)
}
