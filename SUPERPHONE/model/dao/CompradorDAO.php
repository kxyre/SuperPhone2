<?php
    class CompradorDAO {
        public function read() {
            try {
                $query = BD::getConexao()->prepare("SELECT * FROM comprador");
                
                if(!$query->execute()) {
                    print_r($query->errorInfo());
                }

                $listaComprador = array();
                foreach($query->fetchAll(PDO::FETCH_ASSOC) as $linha) {
                    $comprador = new Comprador(); // Classe bean
                    $comprador->setId($linha['idPessoa']);
                    $comprador->setNome($linha['nome']);
                    $comprador->setCpf($linha['cpf']);
                  
                    array_push($listaComprador, $comprador);
                }
                
                return $listaComprador;
            } 
            catch(PDOException $e) {
                echo "Erro #2: " . $e->getMessage();
            }            
        }
    }