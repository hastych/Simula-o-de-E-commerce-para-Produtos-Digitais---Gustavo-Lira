# Simulação-de-E-commerce-para-Produtos-Digitais---Gustavo-Lira
Este projeto simula a infraestrutura de um site de e-commerce focado na venda de produtos digitais, como e-books e cursos online. A arquitetura foi projetada para escalar automaticamente durante períodos de alta demanda, especialmente em campanhas de marketing e datas promocionais.
Arquitetura Inicial do Projeto


Detalhes da Arquitetura
Este projeto utiliza a AWS como provedor de nuvem, configurado com uma arquitetura simplificada:

Front-end

Amazon S3: Armazena os arquivos estáticos do site.
Amazon CloudFront: Configurado como CDN para entrega rápida de conteúdo.
Back-end

Amazon EC2: Hospeda a API que gerencia pedidos e autenticação de usuários.
Auto Scaling: Ajusta automaticamente o número de instâncias de acordo com a demanda.
Banco de Dados

Amazon RDS (MySQL): Configurado dentro de uma VPC, em uma única Zona de Disponibilidade (AZ).
Backups Automáticos: Realizados diariamente para segurança e recuperação de dados.
Armazenamento de Produtos

Amazon S3: Armazena os arquivos digitais, como e-books e cursos.
Segurança

AWS IAM: Gerencia as permissões, limitando o acesso ao back-end apenas para administradores.
Amazon Cognito: Garante a autenticação segura de usuários no front-end.
Monitoramento

Amazon CloudWatch: Monitora o desempenho das instâncias EC2 e notifica a equipe técnica em caso de anomalias.
Gerenciamento de Custos

AWS Budgets: Configurado para alertar quando os custos mensais se aproximam ou ultrapassam o limite definido.
Instruções de Execução
