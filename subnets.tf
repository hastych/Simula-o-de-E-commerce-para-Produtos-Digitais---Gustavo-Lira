resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-public-subnet-${count.index + 1}"
    Environment = var.environment
    Tier        = "Public"
    Managed_by  = "terraform"
  }
}

resource "aws_subnet" "private_app" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index + 4)
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.environment}-private-app-subnet-${count.index + 1}"
    Environment = var.environment
    Tier        = "private-app"
    Managed_by  = "terraform"
  }
}

resource "aws_db_subnet_group" "database-1" {
  name        = "database-1"
  description = "Grupo de Subnet para banco de dados RDS"
  subnet_ids  = aws_subnet.private_db[*].id

  depends_on = [aws_subnet.private_db]

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
    Managed_by  = "terraform"
  }
}

resource "aws_subnet" "private_db" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index + 8)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.environment}-private-db-subnet-${count.index + 1}"
    Environment = var.environment
    Tier        = "private-db"
    Managed_by  = "terraform"
  }
}
