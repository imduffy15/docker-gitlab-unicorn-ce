FROM registry.gitlab.com/gitlab-org/build/cng/gitlab-unicorn-ce:v11.1.4

USER root

RUN apt-get update \
    && apt-get install patch

COPY auth_hash.patch /tmp/auth_hash.patch
COPY user.patch /tmp/user.patch

RUN patch /srv/gitlab/lib/gitlab/auth/o_auth/auth_hash.rb /tmp/auth_hash.patch \
    && patch /srv/gitlab/lib/gitlab/auth/o_auth/user.rb /tmp/user.patch \
    && rm /tmp/auth_hash.patch /tmp/user.patch

COPY config.rb /srv/gitlab/lib/gitlab/auth/o_auth/config.rb


USER git
