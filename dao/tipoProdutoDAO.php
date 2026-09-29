<?php
    class tipoProdutoDAO {
        public function read() {
            try {
                $query = BD::getConexao()->prepare("SELECT * FROM tipoProduto");
                
                if(!$query->execute()) {
                    print_r($query->errorInfo());
                }

                $listaTipoProduto = array();
                foreach($query->fetchAll(PDO::FETCH_ASSOC) as $linha) {
                    $tipoProduto = new tipoProduto(); // Classe bean
                    $tipoProduto->setId($linha['idtipoProduto']);
                    $tipoProduto->setDescricao($linha['descricao']);
                  
                    array_push($listaTipoProduto, $tipoProduto);
                }
                
                return $listaTipoProduto;
            } 
            catch(PDOException $e) {
                echo "Erro #2: " . $e->getMessage();
            }            
        }
    }