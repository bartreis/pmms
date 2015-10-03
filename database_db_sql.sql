CREATE TABLE artigo (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  artigo_penal VARCHAR(50) NULL,
  obs TEXT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE artigo_has_pessoa (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  artigo_id INTEGER UNSIGNED NOT NULL,
  pessoa_id INTEGER UNSIGNED NOT NULL,
  data_prisao DATE NULL,
  obs TEXT NULL,
  PRIMARY KEY(id, artigo_id, pessoa_id),
  INDEX artigo_has_pessoa_FKIndex1(artigo_id),
  INDEX artigo_has_pessoa_FKIndex2(pessoa_id)
);

CREATE TABLE cor_pele (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_cor VARCHAR(50) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE foto (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_foto_id INTEGER UNSIGNED NOT NULL,
  pessoa_id INTEGER UNSIGNED NOT NULL,
  descricao TEXT NULL,
  foto TEXT NULL,
  priority INTEGER UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX foto_FKIndex1(pessoa_id),
  INDEX foto_FKIndex2(tipo_foto_id)
);

CREATE TABLE pessoa (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NULL,
  foto_frente TEXT NULL,
  foto_lado_direito TEXT NULL,
  foto_lado_esquerdo TEXT NULL,
  foto_costas TEXT NULL,
  data_nasc DATE NULL,
  cor_pele_id INTEGER UNSIGNED NOT NULL,
  nome_mae VARCHAR(255) NULL,
  nome_pai VARCHAR(255) NULL,
  naturalidade VARCHAR(255) NULL,
  nacionalidade VARCHAR(255) NULL,
  tatuagens TEXT NULL,
  telefone_1 VARCHAR(20) NULL,
  telefone_2 VARCHAR(20) NULL,
  obs TEXT NULL,
  cadastrado_em TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  INDEX pessoa_FKIndex1(cor_pele_id)
);

CREATE TABLE tipo_foto (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_foto VARCHAR(50) NULL,
  PRIMARY KEY(id)
);


