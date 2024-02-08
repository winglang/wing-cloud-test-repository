bring cloud;

let b = new cloud.Bucket();

let f = new cloud.Function(inflight () => {
  b.put("hello.txt", "world");
});

let api = new cloud.Api();
api.get("/", inflight (req) => {
  return { status: 200, body: "hello, legit" };
});

api.get("/legit", inflight (req) => {
  return { status: 200, body: "hey dudes!" };
});

test "bucket is working" {
  f.invoke("");
}
