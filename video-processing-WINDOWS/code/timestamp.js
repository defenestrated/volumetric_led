inlets = 3
outlets = 1
autowatch = 1

function bang() {
  var dd = tap()
  outlet(0, dd)
}

function tap() {
  var d = new Date()
  switch(inlet) {
  case 0:
    msg = "movement " + d.getTime()
    break
  case 1:
    msg = "stillness " + d.getTime()
    break
  case 2:
    msg = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + d.getDate()
    break
  }

  return msg
}
