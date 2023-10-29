resource "null_resource" "clone_and_deploy" {
	provisioner "local-exec" {
		command = << EOD
			git clone https://github.com/Satachito/exp-pg.git

			cd exp-pg
			
			chmod +x deploy.sh
			./deploy.sh

			# 元のディレクトリに戻る
			cd ..

			# クローンしたリポジトリのディレクトリを削除
			rm -rf yourrepository
		 EOD
	}

	triggers = {
		always_run = "${timestamp()}"
	}
}

