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

var meta_in = this.patcher.newdefault(this.box.rect[0], this.box.rect[1] - 100, "inlet")
var meta_scissors = this.patcher.newdefault(this.box.rect[0], this.box.rect[1] - 50, "jit.scissors", "@columns", 6)

for (var i = 0; i < scissors.length; i++) {
  // pinlets[i] =
  scissors[i] = this.patcher.newdefault(this.box.rect[0] + i * 150, this.box.rect[1] + 30, "jit.scissors", "@columns", 6)
  glues[i] = this.patcher.newdefault(this.box.rect[0] + i * 150, this.box.rect[1] + 90, "jit.glue", "@columns", 6)
}


/*
FOR LEFT FACE:
at time = 1:
slice frame into 6
column 1 goes to video stack 6, position 1
column 2 goes to video stack 5, position 1
column 3 goes to video stack 4, position 1
etc.

at time = 2:
slice frame into 6
column 1 goes to video stack 6, position 2
column 2 goes to video stack 5, position 2
column 3 goes to video stack 4, position 2
etc

-------------------

FOR RIGHT FACE:
at time = 1:
slice frame into 6
column 1 goes to video stack 1, position 6
column 2 goes to video stack 2, position 6
column 3 goes to video stack 3, position 6

at time = 2:
column 1 goes to video stack 1, position 5
*/


// LEFT FACING:
// for each time slice:
// for (var t = 0; t < 6; t++){
//   for (var col = 0; col < 6; col++) {
//     this.patcher.connect(scissors[t], col, glues[5-col], t)
//   }
//   // then connect all to the metaglue
//   this.patcher.connect(glues[t], 0, lastglue, t)
// }

// RIGHT FACING:
// for each time slice:
for (var t = 0; t < 6; t++){
  for (var col = 0; col < 6; col++) {
    this.patcher.connect(scissors[t], col, glues[col], 5-t)
  }
  // then connect all to the metaglue
  this.patcher.connect(glues[t], 0, lastglue, t)
}


this.patcher.connect(lastglue, 0, outie, 0)
this.patcher.connect(meta_in, 0, meta_scissors, 0)

for (var i = 0; i < scissors.length; i++) {
  this.patcher.connect(meta_scissors, i, scissors[i], 0)
}
