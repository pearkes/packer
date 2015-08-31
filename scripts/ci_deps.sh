go get -u github.com/mitchellh/gox
go get -u golang.org/x/tools/cmd/stringer
go list ./... \
    | xargs go list -f '{{join .Deps "\n"}}' \
    | grep -v github.com/mitchellh/packer \
    | grep -v '/internal/' \
    | sort -u \
    | xargs go get -f -u -v -d ; if [ $$? -eq 0 ];

go generate ./...

go get -v -d ./...
