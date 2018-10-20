# workshop-20-10-2018-terraform-eks

## Crear maquina virtual de desarrollo
```
cd vagrant
vagrant up
vagrant ssh
```

## Correr Paso 1: Prueba de humo
```
git checkout step-1
cd /home/app
./terrafunk init
./terrafunk apply
```

## Correr Paso 2: Servidor VPN

## Requisitos
- Crear usuario IAM y obtener sus llaves de acceso
- Crear keypair
- Estableces las variables de ambiente

```
export TF_VAR_aws_access_key=""
export TF_VAR_aws_secret_key=""
export TF_VAR_aws_region="us-west-2"
export TF_VAR_vpc_network_name="terrafunk"
export TF_VAR_eks_cluster_name="terrafunk"
export TF_VAR_eks_cluster_ingress="10.0.0.0/16"
export TF_VAR_vpc_cidr_block="10.0.0.0/16"
export TF_VAR_vpc_subnet_cidr_block="10.0.COUNT_INDEX.0/24"
export TF_VAR_pritunl_server_aws_key_pair_local="/home/app/secrets/terrafunk.pem"
export TF_VAR_pritunl_server_aws_key_pair_name="terrafunk"
```

## Pasos

### Desplegar infraestrucura nueva
```
git checkout step-2
cd /home/app
./terrafunk init
./terrafunk apply
```

## Correr Paso 3: Crear EKS

## Requisitos
- Estableces las variables de ambiente

```
# For Terraform
export TF_VAR_aws_access_key=""
export TF_VAR_aws_secret_key=""
export TF_VAR_aws_region="us-west-2"
export TF_VAR_vpc_network_name="workshop"
export TF_VAR_eks_cluster_name="workshop"
export TF_VAR_eks_cluster_ingress="10.0.0.0/16"
export TF_VAR_vpc_cidr_block="10.0.0.0/16"
export TF_VAR_vpc_subnet_cidr_block="10.0.COUNT_INDEX.0/24"
export TF_VAR_pritunl_server_aws_key_pair_local="/home/app/secrets/terrafunk.pem"
export TF_VAR_pritunl_server_aws_key_pair_name="terrafunk"

# For Kubectl
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION=""
export KUBECONFIG="/home/app/secrets/kubeconfig.yaml"

```

## Pasos

### Desplegar infraestrucura nueva
```
git checkout step-3
cd vagrant
vagrant provision
cd /home/app
./terrafunk init
./terrafunk apply
```
