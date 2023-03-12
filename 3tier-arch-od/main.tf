
module "network" {
  source                = "./modules/network"
  vpc_cidr              = "${var.vpc_cidr_range}"
  public_subnet_x_cidr  = "${var.public_subnetRed_cidr}"
  public_subnet_y_cidr  = "${var.public_subnetGreen_cidr}"
  private_subnet_x_cidr = "${var.private_subnetRed_cidr}"
  private_subnet_y_cidr = "${var.private_subnetGreen_cidr}"
  db_subnet_x_cidr      = "${var.db_subnetRed_cidr}"
  db_subnet_y_cidr      = "${var.db_subnetGreen_cidr}"
}

module "web" {
  source           = "./modules/web"
  public_subnet_x  = "${module.network.public_subnetRed}"
  public_subnet_y  = "${module.network.public_subnetGreen}"
  private_subnet_x = "${module.network.private_subnetRed}"
  private_subnet_y = "${module.network.private_subnetGreen}"
  public_sg        = "${module.network.public_sg}"
  private_sg       = "${module.network.private_sg}"
}

module "database" {
  source              = "./modules/database"
  db_subnet_x         = "${module.network.db_subnetRed}"
  db_subnet_y         = "${module.network.db_subnetGreen}"
  db_security_group   = "${module.network.private_sg}"
  username            = "${var.username}"
  password            = "${var.password}"
  instance_class      = "${var.instance_class}"
  multi_az            = "${var.multi_az}"
  allocated_storage   = "${var.allocated_storage}"
}
