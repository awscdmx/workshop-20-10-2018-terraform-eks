resource "local_file" "world" {
  content     = "What!"
  filename = "${path.module}/World"
}
