<mkconfig

SRC = `{ ls *.c }
OBJ = ${SRC:%.c=%.o}
HDR = `{ ls *.h }
TGT = $NAME

all :VQ: $TGT
	echo -n
$TGT : $OBJ
	$LD $LDFLAGS -o $target $prereq
%.o : %.c
	$CC $CPPFLAGS $CFLAGS  -c -o $target $prereq
%.c :Q: $HDR
	echo -n
%.h :Q:
	echo -n
install : $TGT
	sudo cp -f $TGT $BIN/
	sudo chmod 0755 $BIN/$TGT
	sudo chmod u+s $BIN/$TGT
	mkdir -p $MAN/1
	sed 's/NAME/'$NAME'/'<man > $MAN/1/$NAME
uninstall: 
	rm -f $ROOT/bin/$TGT
clean :
	rm -rf $TGT *.o 
