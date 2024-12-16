FEATURE: Avaliação / Review das salas + disparo dos e-mails
    AS um professor cadastrado no SAGA
    I WANT TO Criar, remover e editar avaliações
    SO THAT consiga avaliar as salas que foram reservadas

SCENARIO: Avaliação para uma sala (com comentário) + confirmação de e-mail
    GIVEN eu estou logado no sistema como professor com o e-mail “joao@email.com” e senha “244466666”
    AND estou na página de Avaliações
    AND tento acessar a seção de “Histórico de Reservas”
    WHEN tento selecionar a nota “5”  para a sala “E001”
    AND insiro o comentário “Excelente sala para reuniões”
    AND tento realizar a ação de “Salvar”
    THEN vejo a avaliação salva no sistema com a nota “5” e o comentário inserido no campo “Escreva um feedback”
    AND posso ver a mensagem “Avaliação enviada com sucesso”
    AND um e-mail de confirmação é enviado para “joao@email.com” com o assunto “Confirmação de avaliação de sala”

SCENARIO: Tentativa de avaliação sem nota
    GIVEN eu estou logado no sistema como professor com o e-mail “joao@email.com” e senha “244466666”
    AND estou na página de Avaliações
    AND tento acessar a seção de “Histórico de Reservas”
    WHEN tento avaliar a sala “E002”
    AND insiro um comentário no campo “Escreva seu feedback”
    AND tento realizar a açao de “Salvar”
    THEN posso ver a mensagem de erro “Por favor, selecione uma nota para avaliar a sala”
    AND a avaliação não é salva no sistema
    AND nenhum e-mail é enviado para “joao@email.com”

SCENARIO: Edição de uma avaliação feita anteriormente
    GIVEN eu estou logado no sistema como professor com o e-mail “joao@email.com” e senha “244466666”
    AND estou na página de Avaliações
    AND já avaliei a sala “E001” com o comentário “Excelente sala para reuniões” e a nota “4”
    WHEN tento acessar a seção de “Histórico de Reservas”
    AND tento editar em “Editar avaliação” a avaliação da sala “E001”
    AND tento alterar o comentário para “Excelente sala para reuniões, muito bem equipada e arejada”
    AND tento alterar a nota para “5”
    AND realizo o salvamento no botão “Salvar”
    THEN a avaliação é salva no sistema com a nota “5” e o novo comentário inserido no campo “Escreva um feedback”
    AND posso ver a mensagem “Avaliação atualizada com sucesso”
    AND um e-mail de confirmação é enviado para “joao@email.com” com o assunto “Sua avaliação foi atualizada com sucesso”

SCENARIO: Remoção de uma avaliação
    GIVEN eu estou logado no sistema como professor com o e-mail “joao@email.com” e senha “244466666”
    AND estou na página de Avaliações
    AND estou na seção “Histórico de Reservas”
    WHEN tento selecionar “Editar avaliação” na avaliação feita para a sala “E001”
    AND tento realizar a ação de exclusão em “Excluir avaliação”
    AND posso ver a mensagem “Tem certeza que deseja excluir a avaliação?” com as opções “Sim” e “Não”
    AND tento selecionar a opção “Sim”
    THEN a avaliação é deletada do sistema
    AND posso ver que a mensagem “Avaliação deletada com sucesso”
    AND a avaliação não aparece mais em Avaliações
    AND um e-mail de confirmação é enviado para “joao@email.com” com o assunto “Avaliação de sala deletada com sucesso”
