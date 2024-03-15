##################################################################################
# RESOURCES
##################################################################################

#Random ID
resource "random_integer" "rand" {
  min = 100
  max = 99999
}

resource "aws_s3_bucket" "web_bucket" {
  bucket        = "tada-${random_integer.rand.result}"
  acl           = "private"
  force_destroy = true

  tags = merge(local.common_tags, { Name = "${var.cName}-web-bucket" })

}