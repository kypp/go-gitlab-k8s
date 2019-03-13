# go-gitlab-k8s

This is a complete template for a golang microservice deployed on a Kubernetes cluster via gitlab-ci.

The bare docker image with an http server and ca-certificates weights < 6MB.

---

Quick parachute drop without cloning:
```bash
  curl -L https://github.com/kypp/go-gitlab-k8s/archive/master.tar.gz | tar xz --strip-components 1
```

After the drop:
1. Ensure the `KUBE_INGRESS_BASE_DOMAIN` is set, either on a higher level (see [documentation](https://docs.gitlab.com/ee/topics/autodevops/#auto-devops-base-domain)) or by uncommenting the 7th line in the `.gitlab-ci.yml` file
2. Create the GitLab project 
3. In `Settings->Repository->Deploy Tokens` create a token named `gitlab-deploy-token` with `read_registry` scope (see [here](https://docs.gitlab.com/ee/user/project/deploy_tokens/#gitlab-deploy-token) for explanation)
4. Push to GitLab

---

Includes:
- two-stage production Dockerfile for optimal image size
- docker-compose for development with live reload
- automated kubernetes deployment based on GitLab autodevops
- basic health check endpoint (at /healthz)

---

Credits:
- Gitlab CI/CD AutoDevOps: [https://docs.gitlab.com/ee/topics/autodevops/](https://docs.gitlab.com/ee/topics/autodevops/)
- Tips for minimal secure golang docker image: [article on medium](https://medium.com/@chemidy/create-the-smallest-and-secured-golang-docker-image-based-on-scratch-4752223b7324)
- go-reload script: [https://github.com/alexedwards/go-reload](https://github.com/alexedwards/go-reload)