from tkinter import *

root = Tk()

# tạo một widget Canvas để chứa label_output
canvas = Canvas(root, borderwidth=0, background="#ffffff")
scrollbar = Scrollbar(root, orient="vertical", command=canvas.yview)
scrollable_frame = Frame(canvas)

scrollable_frame.bind(
    "<Configure>",
    lambda e: canvas.configure(
        scrollregion=canvas.bbox("all")
    )
)

canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
canvas.configure(yscrollcommand=scrollbar.set)

# thêm label_output vào scrollable_frame thay vì root
label_output = Label(scrollable_frame, borderwidth=1, relief="ridge", height=10, width=100, bg="white", text="Hello World!")
label_output.grid(column=0, row=0, pady=10)

# thêm canvas và scrollbar vào root
canvas.grid(column=0, row=5, columnspan=4, pady=10, sticky="NSEW")
scrollbar.grid(column=4, row=5, sticky="NS")

root.mainloop()