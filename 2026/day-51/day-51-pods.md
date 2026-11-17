# Day 51 – Kubernetes Manifests and Your First Pods

## The Anatomy of a Kubernetes Manifest

Every Kubernetes resource is defined using a YAML manifest with four required top-level fields:

```yaml
apiVersion: v1          # Which API version to use
kind: Pod               # What type of resource
metadata:               # Name, labels, namespace
  name: my-pod
  labels:
    app: my-app
spec:                   # The actual specification (what you want)
  containers:
  - name: my-container
    image: nginx:latest
    ports:
    - containerPort: 80
```

- `apiVersion` — tells Kubernetes which API group to use. For Pods, it is `v1`.
- `kind` — the resource type. Today it is `Pod`. Later you will use `Deployment`, `Service`, etc.
- `metadata` — the identity of your resource. `name` is required. `labels` are key-value pairs used for organization and selection.
- `spec` — the desired state. For a Pod, this means which containers to run, which images, which ports, etc.

---

### Task 1: Create Your First Pod (Nginx)
Create a file called `nginx-pod.yaml`:

Apply it:
```bash
kubectl apply -f nginx-pod.yaml
```

![snapshot](images/img1.png)

Verify:
```bash
kubectl get pods
kubectl get pods -o wide
```

![snapshot](images/img2.png)

Wait until the STATUS shows `Running`. Then explore:
```bash
# Detailed info about the pod
kubectl describe pod nginx-pod

# Read the logs
kubectl logs nginx-pod

# Get a shell inside the container
kubectl exec -it nginx-pod -- /bin/bash

# Inside the container, run:
curl localhost:80
exit
```

![snapshot](images/img3.png)

![snapshot](images/img4.png)

**Verify:** Can you see the Nginx welcome page when you curl from inside the pod?

> Yes, I can see the Nginx welcome page!

---

### Task 2: Create a Custom Pod (BusyBox)
Write a new manifest `busybox-pod.yaml` from scratch (do not copy-paste the nginx one):

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox-pod
  labels:
    app: busybox
    environment: dev
spec:
  containers:
  - name: busybox
    image: busybox:latest
    command: ["sh", "-c", "echo Hello from BusyBox && sleep 3600"]
```

Apply and verify:
```bash
kubectl apply -f busybox-pod.yaml
kubectl get pods
kubectl logs busybox-pod
```

![snapshot](images/img5.png)

Notice the `command` field — BusyBox does not run a long-lived server like Nginx. Without a command that keeps it running, the container would exit immediately and the pod would go into `CrashLoopBackOff`.

**Verify:** Can you see "Hello from BusyBox" in the logs?

> Yes!

---

### Task 3: Imperative vs Declarative
You have been using the declarative approach (writing YAML, then `kubectl apply`). Kubernetes also supports imperative commands:

```bash
# Create a pod without a YAML file
kubectl run redis-pod --image=redis:latest

# Check it
kubectl get pods
```

![snapshot](images/img6.png)

Now extract the YAML that Kubernetes generated:
```bash
kubectl get pod redis-pod -o yaml
```

![snapshot](images/img7.png)

Compare this output with your hand-written manifests. Notice how much extra metadata Kubernetes adds automatically (status, timestamps, uid, resource version).

You can also use dry-run to generate YAML without creating anything:
```bash
kubectl run test-pod --image=nginx --dry-run=client -o yaml
```

This is a powerful trick — use it to quickly scaffold a manifest, then customize it.

**Verify:** Save the dry-run output to a file and compare its structure with your nginx-pod.yaml. What fields are the same? What is different?

![snapshot](images/img8.png)

```bash
- Label: I wrote `app: nginx`, but `kubectl run` generated `run: test-pod`.
- Container name: I named my container `nginx`, but kubectl reused the pod name `test-pod`.
- Image: I wrote `nginx:latest`, but kubectl used just `nginx`. They mean the same thing, since no tag defaults to `latest`.
- Ports: I declared `containerPort: 80`, but kubectl left ports out because I didn't pass `--port=80`.
- Resources: I didn't write a `resources` block, but kubectl added an empty `resources: {}`.
- DNS policy: I didn't set one, but kubectl added `dnsPolicy: ClusterFirst`.
- Restart policy: I didn't set one, but kubectl added `restartPolicy: Always`.
- Status: I didn't include a `status` section, but kubectl added `status: {}`.
- Field order: I put `name` before `labels`, but kubectl sorted them alphabetically, so `labels` comes first.

Key point: the extra fields kubectl added are just defaults.
Kubernetes fills them in anyway when I apply my file, which is why they
appeared in my describe output even though I never wrote them.
```

### Task 4: Validate Before Applying
Before applying a manifest, you can validate it:

```bash
# Check if the YAML is valid without actually creating the resource
kubectl apply -f nginx-pod.yaml --dry-run=client

# Validate against the cluster's API (server-side validation)
kubectl apply -f nginx-pod.yaml --dry-run=server
```
![snapshot](images/img9.png)

Now intentionally break your YAML (remove the `image` field or add an invalid field) and run dry-run again. See what error you get.

**Verify:** What error does Kubernetes give when the image field is missing?

> Intentionally broke the YML and got the error saying:
> The Pod "nginx-pod" is invalid: spec.containers[0].image: Required value

---

### Task 5: Pod Labels and Filtering
Labels are how Kubernetes organizes and selects resources. You added labels in your manifests — now use them:

```bash
# List all pods with their labels
kubectl get pods --show-labels

# Filter pods by label
kubectl get pods -l app=nginx
kubectl get pods -l environment=dev

# Add a label to an existing pod
kubectl label pod nginx-pod environment=production

# Verify
kubectl get pods --show-labels

# Remove a label
kubectl label pod nginx-pod environment-
```

![snapshot](images/img10.png)

Write a manifest for a third pod with at least 3 labels (app, environment, team). Apply it and practice filtering.

![snapshot](images/img11.png)

---

### Task 6: Clean Up
Delete all the pods you created:

```bash
# Delete by name
kubectl delete pod nginx-pod
kubectl delete pod busybox-pod
kubectl delete pod redis-pod

# Or delete using the manifest file
kubectl delete -f nginx-pod.yaml

# Verify everything is gone
kubectl get pods
```

![snapshot](images/img12.png)

> I noticed that when I deleted a standalone Pod, it is gone forever. There is no controller to recreate it.
