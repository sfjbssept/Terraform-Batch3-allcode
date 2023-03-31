provisioner "file" {
    source ="D:/Terraform_batch3_TCS(28-03-23)/Req.txt"
    destination ="/home/ubuntu/Req.txt"
}

provisioner "local-exec" {
    command = "touch Req.txt"
}


provisioner "remote-exec" {
    inline =[
        "sudo apt update",
        "sudo apt install apache2"
    ]
}