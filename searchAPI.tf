resource "null_resource" "clone_and_deploy" {
	provisioner "local-exec" {
		command = <<EOT
			git clone https://github.com/Satachito/exp-pg.git

			cd exp-pg
			sh deploy.sh
			cd ..

			rm -rf exp-pg
		 EOT
	}

	triggers = {
		always_run = "${timestamp()}"
	}
}

