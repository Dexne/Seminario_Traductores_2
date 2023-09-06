all: parser

parser: lex.yy.c parser.tab.c tokens.tab.h
	gcc -o parser parser.tab.c lex.yy.c

parser.tab.c tokens.tab.h: parser.y
	bison -t -v -d parser.y

lex.yy.c: tokens.l tokens.tab.h
	flex tokens.l

clean:
	rm parser parser.tab.c lex.yy.c parser.tab.h parser.output
