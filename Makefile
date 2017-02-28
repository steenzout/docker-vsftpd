.PHONY: default
default: image ;

image:
	docker build -t steenzout/vsftpd:latest -f Dockerfile .
