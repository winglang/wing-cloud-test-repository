bring cloud;

let b = new cloud.Bucket();

new cloud.Function(inflight () => {
  b.put("hello.txt", "world");
});

break m1@11!!
