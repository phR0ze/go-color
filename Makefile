NAME := color
PKGROOT := github.com/phR0ze/go-color

# Pass in git versions for build
GIT_COMMIT_LONG := $(strip $(shell git rev-parse HEAD 2>/dev/null))
LDFLAGS := '-X main.gitCommit=$(GIT_COMMIT_LONG) -X main.buildDate=$(shell date +%Y%m%d)'

default: $(NAME)
$(NAME): $(DEPDIR)
	go build -ldflags ${LDFLAGS} -o bin/$(NAME) $(PKGROOT)

test: $(NAME)
	@echo -e "\nRunning all go tests:"
	@echo -e "------------------------------------------------------------------------"
	go test $(PKGROOT)

clean:
	rm -f ./bin/$(NAME)
