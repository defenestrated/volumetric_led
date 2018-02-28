import math
print "\n"

total = 7680

sq = math.sqrt(total)

print "sqrt of", total, "is", sq

n = math.floor(sq)
while (total % n != 0):
    print "trying", n
    n -= 1

print "done"
print n, total/n
