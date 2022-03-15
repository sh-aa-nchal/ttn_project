module "network" {
  source = "./modules/network"
  main_vpc_cidr =
  public_subnet1 =
  public_subnet2 = 
}
  
module "alb" {
  source  = "./modules/alb"
  subnet1 =
  subnet2 =
}
  
module "asg" {
  source = "./modules/asg"
  ami_id =
  instance_type = 
  desired_cap =
  max_count =
  min_count =
  subnet1_id =
  subnet2_id =
  min_healthy =
  
}
  
module "database" {
  source = "./modules/database"
  
}
  
module "monitoring" {
  source = "./modules/monitoring"
}
  
