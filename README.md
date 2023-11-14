What does the code on lines 25 and 29 do? На 25 строке, мы задаём, что к элементу не надо применять авто компоновку. На 29 строке мы привязываем к главному view - subview и можем распологать его относительно view.
What is a safe area layout guide? Safe layout guide - область, в которой объекты будут отображаться корректно, не вылезая за скругленные углы экрана или на "вырез" камеры и другие особенности экрана.
What is [weak self] on line 23 and why it is important? Weak self - это список захвата, используемый с целью замыкания для создания "слабых" ссылок на класс или структуру. В нашем примере, если не использовать слабое связывание, то произойдет цикл в замыкании.
What does clipsToBounds mean? Говорим программе, должно ли subview вписываться в границы view
What is the valueChanged type? What is Void and what is Double? valueChanged соответствует функции, которая принимает параметр типа double и ничего не возвращает(void)
