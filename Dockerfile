FROM alpine:3.12.1

ARG KUBECTL_VERSION=1.17.5

RUN apk add --no-cache bash graphviz ttf-linux-libertine

# Install kubectl
RUN apk add --update --no-cache curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl
	
# Install jq
RUN apk add --update --no-cache jq

COPY icons /icons

COPY k8sviz.sh /

CMD /k8sviz.sh && chmod +x /k8sviz.sh

