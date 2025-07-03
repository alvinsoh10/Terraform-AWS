terraform{
    backend "s3"{
        bucket = "alvin-ecv-bucket"
        key = "terraform.tfstate"
        region = "ap-southeast-1"
    }
}