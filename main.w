bring cloud;
bring http;
bring containers;

let demo = new containers.Workload(
  name: "demo",
  image: "./test",
  port: 3000,
  public: true,
) as "demo_container";

new cloud.Endpoint(demo.publicUrl!) as "demo_container_endpoint";

new cloud.Queue().setConsumer(inflight (m) => {
  http.post("{demo.publicUrl!}", body: m);
});

let b = new cloud.Bucket();

let f = new cloud.Function(inflight () => {
  b.put("hello.txt", "world");
});

let api = new cloud.Api();
api.get("/", inflight (req) => {
  return { status: 200, body: "hello, hello" };
});

test "bucket is working" {
  f.invoke("");
}
