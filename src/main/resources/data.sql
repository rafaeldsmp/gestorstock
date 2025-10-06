-- Categorias
INSERT INTO categoria (nome, descricao) VALUES
('Eletrônicos', 'Produtos eletrônicos em geral'),
('Alimentos', 'Produtos alimentícios e bebidas'),
('Vestuário', 'Roupas e acessórios'),
('Esportes', 'Artigos esportivos'),
('Brinquedos', 'Brinquedos para crianças');

-- Fornecedores
INSERT INTO fornecedor (nome, cnpj, telefone, email) VALUES
('Fornecedor A', '12345678000101', '(11)1111-1111', 'a@fornecedor.com'),
('Fornecedor B', '22345678000102', '(11)2222-2222', 'b@fornecedor.com'),
('Fornecedor C', '32345678000103', '(11)3333-3333', 'c@fornecedor.com'),
('Fornecedor D', '42345678000104', '(11)4444-4444', 'd@fornecedor.com'),
('Fornecedor E', '52345678000105', '(11)5555-5555', 'e@fornecedor.com');

-- Produtos (25 produtos distribuídos entre categorias e fornecedores)
INSERT INTO produto (nome, descricao, preco, estoque_minimo, categoria_id, fornecedor_id) VALUES
('Smartphone XYZ', 'Celular de última geração', 2500.00, 10, 1, 1),
('Notebook ABC', 'Notebook potente', 4500.00, 5, 1, 2),
('Tablet 123', 'Tablet leve e rápido', 1500.00, 8, 1, 3),
('Camiseta Masculina', 'Camiseta de algodão', 50.00, 20, 3, 4),
('Calça Jeans', 'Calça masculina', 120.00, 15, 3, 5),
('Tênis Esportivo', 'Tênis para corrida', 200.00, 12, 4, 1),
('Bola de Futebol', 'Bola oficial', 150.00, 30, 4, 2),
('Bicicleta MTB', 'Bicicleta aro 29', 1800.00, 3, 4, 3),
('Pizza Congelada', 'Pizza de queijo', 25.00, 50, 2, 4),
('Suco Natural', 'Suco de laranja', 8.00, 60, 2, 5),
('Boneca Barbie', 'Boneca fashion', 120.00, 10, 5, 1),
('Carrinho de Controle', 'Carrinho elétrico', 300.00, 5, 5, 2),
('Fone de Ouvido', 'Fone bluetooth', 200.00, 15, 1, 3),
('Smartwatch', 'Relógio inteligente', 800.00, 7, 1, 4),
('Cafeteira', 'Cafeteira elétrica', 350.00, 6, 1, 5),
('Camiseta Feminina', 'Camiseta estampada', 60.00, 18, 3, 1),
('Vestido Casual', 'Vestido de verão', 180.00, 8, 3, 2),
('Chuteira', 'Chuteira de campo', 250.00, 10, 4, 3),
('Raquete de Tênis', 'Raquete profissional', 400.00, 4, 4, 4),
('Cereal Matinal', 'Cereal integral', 15.00, 40, 2, 5),
('Chocolate', 'Chocolate ao leite', 10.00, 60, 2, 1),
('Lego Star Wars', 'Lego coleção', 350.00, 7, 5, 2),
('Quebra-cabeça', 'Puzzle 1000 peças', 80.00, 12, 5, 3),
('Cafeteira Expresso', 'Máquina de café expresso', 500.00, 5, 1, 4),
('Monitor LED', 'Monitor 27 polegadas', 1200.00, 5, 1, 5),
('Bolsa Feminina', 'Bolsa de couro', 300.00, 8, 3, 1);

-- Usuários
INSERT INTO usuario (nome, senha, email, data_aniversario, roles) VALUES
('Rafael', 'senha123', 'rafael@email.com', '1987-02-14', 'ADMIN'),
('Joana', 'senha123', 'joana@email.com', '1990-05-20', 'USER'),
('Carlos', 'senha123', 'carlos@email.com', '1985-09-10', 'USER'),
('Mariana', 'senha123', 'mariana@email.com', '1992-11-05', 'USER'),
('Ana', 'senha123', 'ana@email.com', '1988-01-30', 'USER');
