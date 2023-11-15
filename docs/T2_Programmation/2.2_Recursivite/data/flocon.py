import turtle as t
def flocon(n, taille):
    t.speed(0)
    if n == 0:
        t.forward(taille)
    else:
        flocon(n - 1, taille / 3)
        t.left(60)
        flocon(n - 1, taille / 3)
        t.right(120)
        flocon(n - 1, taille / 3)
        t.left(60)
        flocon(n - 1, taille / 3)

flocon(5, 400)
t.mainloop()