compiler: lexer.o parser.o ast.o
    gcc lexer.o parser.o ast.o -o compiler

lexer.o: lexer.c
    gcc lexer.c -c -o lexer.o

parser.o: parser.c
    gcc parser.c -c -o parser.o

ast.o: ast.c
    gcc ast.c -c -o ast.o

lexer.c: lexer.l
    flex -o lexer.c lexer.l

parser.c: parser.y
    bison -d -o parser.c parser.y



compiler: lexer.o parser.o ast.o
    gcc $^ -o $@

%.o: %.c
    gcc $^ -c -o $@

lexer.c: lexer.l
    flex -o $@ $^

parser.c: parser.y
    bison -d -o $@ $^