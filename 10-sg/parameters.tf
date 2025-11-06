resource "aws_ssm_parameter" "sg_id" {
  count = length(var.sg_names)
  name = "/${var.project_name}/${var.environment}/${var.sg_names[count.index]}_sg_id" # /roboshop/dev/catalogue_sg_id
  type = "String"
  value = module.sg[count.index].sg_id
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type = "StringList"
  value = join(",",module.vpc.public_subnet_ids)
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type = "StringList"
  value = join(",",module.vpc.private_subnet_ids)
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/database_subnet_ids"
  type = "StringList"
  value = join(",",module.vpc.database_subnet_ids)
}