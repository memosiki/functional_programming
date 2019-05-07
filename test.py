from random import *

n = 6
m = n // 2
while True :
    failed = False
    a = [0] + [randint(-2, 2) for i in range(n)]

    for i in range(1, n+1):
        if not( a[2*m-i+1] < a[i] <= a[2*m-i] ):
            failed = True
    if not failed:
        break

print(a)
