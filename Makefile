PROGNAME=sosi2osm
OBJFILES=sosi2osm.o sosi.o tag.o node.o

CPPFLAGS = -I /usr/local/include/fyba/ `pkg-config --cflags lua5.1-c++` -DLINUX -DUNIX -g
LDFLAGS = -lfyba -lfygm -lfyut -lproj `pkg-config --libs lua5.1-c++`

INSTALL = /usr/local/bin/install -c
INSTALLDATA = /usr/local/bin/install -c -m 644


# Where to put executable commands on 'make install'?
BIN     = $(DESTDIR)/usr/bin
# Where to put lua-files on 'make install'?
LUA = $(DESTDIR)/usr/share/sosi2osm

all: $(PROGNAME)

clean:
	$(RM) $(PROGNAME) $(OBJFILES) *~

install: all
	$(INSTALL) $(PROGNAME) $(BIN)/$(PROGNAME)
	$(INSTALLDATA) lua/* $(LUA)/

$(PROGNAME): $(OBJFILES)
	$(CXX) $^ $(LDFLAGS) -o $@
