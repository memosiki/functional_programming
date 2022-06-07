from random import *

n = 6
m = n // 2
while True:
    a = [0] + [randint(-2, 2) for _ in range(n)]

    failed = any(not( a[2*m-i+1] < a[i] <= a[2*m-i] ) for i in range(1, n+1))
    if not failed:
        break

print(a)
