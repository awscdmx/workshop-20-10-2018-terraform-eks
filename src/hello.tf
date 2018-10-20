resource "local_file" "hello" {
  content     = "World!"
  filename = "${path.module}/Hello"
}
