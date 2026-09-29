<?php
    class formaPagamentoDAO {
        public function read() {
            try {
                $query = BD::getConexao()->prepare("SELECT * FROM formapagamento");
                
                if(!$query->execute()) {
                    print_r($query->errorInfo());
                }

                $listaFormaPagamento = array();
                foreach($query->fetchAll(PDO::FETCH_ASSOC) as $linha) {
                    $formaPagamento = new formaPagamento(); // Classe bean
                    $formaPagamento->setId($linha['idformaPagamento']);
                    $formaPagamento->setDescricao($linha['descricao']);
                  
                    array_push($listaFormaPagamento, $formaPagamento);
                }
                
                return $listaFormaPagamento;
            } 
            catch(PDOException $e) {
                echo "Erro #2: " . $e->getMessage();
            }            
        }
    }