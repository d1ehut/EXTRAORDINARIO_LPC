from tkinter import *
from tkinter.ttk import *
from time import strftime

wnd = Tk()
wnd.title('Reloj-Tarea 8-1948690')


def hora():
    datos = strftime('%I:%M:%S %p')
    label.config(text=datos)
    label.after(1000, hora)


label = Label(wnd, font=('Arial', 50), padding='40', background='black', foreground='pink')
label.pack(expand=True)
hora()
mainloop()
