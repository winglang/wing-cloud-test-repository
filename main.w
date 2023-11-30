bring cloud;

let b = new cloud.Bucket();
let s = new cloud.Secret(name: "hello");

let f = new cloud.Function(inflight () => {
  b.put("hello.txt", "world");
  log(s.value());
});

test "bucket is working" {
  f.invoke("");
}
