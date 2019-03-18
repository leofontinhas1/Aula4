
CREATE TABLE `cidade` (
  `id_cidade` int(11) NOT NULL,
  `cidade` varchar(90) NOT NULL,
  `uf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(90) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `id_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `rua` varchar(90) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `cep` varchar(90) NOT NULL,
  `id_cidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `recibo` (
  `id_recibo` int(11) NOT NULL,
  `sequencia` int(11) NOT NULL,
  `valor` double NOT NULL,
  `data` date NOT NULL,
  `assinatura` varchar(90) NOT NULL,
  `referente` varchar(90) NOT NULL,
  `id_cidade` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(90) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `login` varchar(90) NOT NULL,
  `senha` varchar(90) NOT NULL,
  `id_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id_cidade`);


ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_edereco_fk` (`id_endereco`);

ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `id_cidade_fk` (`id_cidade`);

ALTER TABLE `recibo`
  ADD PRIMARY KEY (`id_recibo`),
  ADD KEY `id_cidade_fk` (`id_cidade`),
  ADD KEY `id_usuario_fk` (`id_usuario`),
  ADD KEY `id_cliente_fk` (`id_cliente`);

ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_endereco_fk` (`id_endereco`);

ALTER TABLE `cidade`
  MODIFY `id_cidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `recibo`
  MODIFY `id_recibo` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `cliente`
  ADD CONSTRAINT `id_endereco_fk` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

