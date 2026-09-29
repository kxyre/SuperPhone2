<?php
    class CompradorDAO {

        public function create($comprador) {
            try {
                $query = BD::getConexao()->prepare(
                    "INSERT INTO comprador(nome, cpf) 
                    VALUES (:n, :c)"
                );
                $query->bindValue(':n', $comprador->getNome(), PDO::PARAM_STR);
                $query->bindValue(':c', $comprador->getCpf(), PDO::PARAM_STR);
                

                if(!$query->execute()) {
                    print_r($query->errorInfo());
                }
            }
            catch(PDOException $e) {
                echo "Erro #1: " . $e->getMessage();
            }
        }

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

         public function find($id) {
            try {
                $query = BD::getConexao()->prepare("SELECT * FROM comprador WHERE idPessoa = :i");
                $query->bindValue(':i', $id, PDO::PARAM_INT);

                if(!$query->execute()) {
                    print_r($query->errorInfo());
                }

                 if($linha = $query->fetch(PDO::FETCH_ASSOC)) {
                    $comprador = new Comprador(); // Classe bean
                    $comprador->setId($linha['idPessoa']);
                    $comprador->setNome($linha['nome']);
                    $comprador->setCpf($linha['cpf']);
                }
                
                return $comprador;
            } 
            catch(PDOException $e) {
                echo "Erro #3: " . $e->getMessage();
            }            
        }
        public function update($comprador) {
            try {
                $query = BD::getConexao()->prepare(
                    "UPDATE comprador
                     SET nome = :n, cpf= :c
                     WHERE idPessoa = :i" 
            
                );
                $query->bindValue(':n', $comprador->getNome(), PDO::PARAM_STR);
                $query->bindValue(':c', $comprador->getCpf(), PDO::PARAM_STR);
                $query->bindValue(':i', $comprador->getId(), PDO::PARAM_INT);
                

                if(!$query->execute()) {
                    print_r($query->errorInfo());
                }
            }
            catch(PDOException $e) {
                echo "Erro #4: " . $e->getMessage();
            }
        }

         public function destroy($id) {
            try {
                $query = BD::getConexao()->prepare(
                    "DELETE FROM comprador
                     WHERE idPessoa = :i" 
            
                );
                 $query->bindValue(':i', $id->getId(), PDO::PARAM_INT);

                if(!$query->execute()) {
                    print_r($query->errorInfo());
                }
            }
            catch(PDOException $e) {
                echo "Erro #5: " . $e->getMessage();
            }
        }

    }