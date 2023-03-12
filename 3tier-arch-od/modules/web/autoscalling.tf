# ---------------------------------------------------------------------------------------------------------------------
# AUTO SCALING GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_autoscaling_group" "autoscaling_group" {
  launch_configuration = "${aws_launch_configuration.launch_configuration.id}"
  vpc_zone_identifier  = ["${var.private_subnetRed}", "${var.private_subnetGreen}"]
  min_size             = 3
  max_size             = 5
  load_balancers       = ["${aws_elb.elb.name}"]
  health_check_type    = "ELB"

  tag {
    key                 = "Name"
    value               = "autoscaling_group"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# LAUNCH CONFIGURATION
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_launch_configuration" "launch_configuration" {
  image_id             = "ami-0f756a4db96e5bc57"
  instance_type        = "t2.micro"
  security_groups      = ["${var.private_sg}"]
  iam_instance_profile = "${aws_iam_instance_profile.instance_profile.id}"

  user_data = <<-EOF
              #!/bin/bash
              echo "Here is your assignment" > index.html
              nohup busybox httpd -f -p 80 &
              sudo apt-get install -y postgresql-client
              EOF

  lifecycle {
    create_before_destroy = true
  }
}
