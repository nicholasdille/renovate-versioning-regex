FROM golang:1.14 AS base

# renovate: datasource=github-tags depName=kubernetes-sigs/kustomize versioning=regex:^kustomize\/v(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)$
ENV KUSTOMIZE_VERSION=kustomize/v3.7.0

RUN unset GOPATH \
 && unset GO111MODULES \
 && git clone git@github.com:kubernetes-sigs/kustomize.git \
 && cd kustomize \
 && git checkout ${KUSTOMIZE_VERSION} \
 && (cd kustomize; go install .) \
 && ~/go/bin/kustomize version
