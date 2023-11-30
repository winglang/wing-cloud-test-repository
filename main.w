bring cloud;

let b = new cloud.Bucket();

let f = new cloud.Function(inflight () => {
  b.put("hello.txt", "world");
});

test "bucket is working" {
  f.invoke("");
}
