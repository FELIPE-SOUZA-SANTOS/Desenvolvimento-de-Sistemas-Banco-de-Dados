from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

# Inicialização do Flask
app = Flask(__name__)

# Configuração do banco
bd_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'escola',
    'database': 'Integracao'
}

# Página inicial
@app.route('/')
def index():
    return render_template('index.html')


# CADASTRAR CLIENTE
@app.route('/cadastrar', methods=['POST'])
def cadastrar():

    try:

        # Recebendo dados do formulário
        cpf = request.form['cpf'].strip()
        primeiro_nome = request.form['primeiro_nome'].strip()
        sobrenome = request.form['sobrenome'].strip()
        idade = request.form['idade'].strip()

        # Conexão
        conexao = mysql.connector.connect(**bd_config)

        # Cursor
        cursor = conexao.cursor()

        # SQL
        sql = """
        INSERT INTO cliente (cpf, primeiro_nome, sobrenome, idade)
        VALUES (%s, %s, %s, %s)
        """

        valores = (cpf, primeiro_nome, sobrenome, idade)

        cursor.execute(sql, valores)

        conexao.commit()

        cursor.close()
        conexao.close()

        # Atualiza a página automaticamente
        return redirect(url_for('listar_clientes'))

    except mysql.connector.Error as erro:
        return f'Erro ao cadastrar: {erro}'


# LISTAR CLIENTES
@app.route('/clientes')
def listar_clientes():

    try:

        # Conexão
        conexao = mysql.connector.connect(**bd_config)

        # Cursor
        cursor = conexao.cursor()

        # Buscar dados
        sql = "SELECT * FROM cliente"

        cursor.execute(sql)

        clientes = cursor.fetchall()

        cursor.close()
        conexao.close()

        # Envia dados para o HTML
        return render_template(
            'clientes.html',
            clientes=clientes
        )

    except mysql.connector.Error as erro:
        return f'Erro ao buscar clientes: {erro}'


# DELETAR CLIENTE
@app.route('/deletar/<cpf>')
def deletar_cliente(cpf):

    try:

        # Conexão
        conexao = mysql.connector.connect(**bd_config)

        # Cursor
        cursor = conexao.cursor()

        # SQL DELETE
        sql = "DELETE FROM cliente WHERE cpf = %s"

        cursor.execute(sql, (cpf,))

        conexao.commit()

        cursor.close()
        conexao.close()

        # Atualiza tabela
        return redirect(url_for('listar_clientes'))

    except mysql.connector.Error as erro:
        return f'Erro ao deletar: {erro}'

@app.route('/produtos')
def produtos():

    conexao = mysql.connector.connect(**bd_config)

    cursor = conexao.cursor()

    sql = "SELECT * FROM produto"

    cursor.execute(sql)

    produtos = cursor.fetchall()

    cursor.close()
    conexao.close()

    return render_template(
        'produtos.html',
        produtos=produtos
    )

@app.route('/cadastrar_produto', methods=['POST'])
def cadastrar_produto():

    nome = request.form['nome']
    categoria = request.form['categoria']
    preco = request.form['preco']
    quantidade = request.form['quantidade']

    conexao = mysql.connector.connect(**bd_config)

    cursor = conexao.cursor()

    sql = """
    INSERT INTO produto
    (nome, categoria, preco, quantidade)

    VALUES (%s, %s, %s, %s)
    """

    valores = (
        nome,
        categoria,
        preco,
        quantidade
    )

    cursor.execute(sql, valores)

    conexao.commit()

    cursor.close()
    conexao.close()

    return redirect(url_for('produtos'))

@app.route('/deletar_produto/<int:id>')
def deletar_produto(id):

    conexao = mysql.connector.connect(**bd_config)

    cursor = conexao.cursor()

    sql = "DELETE FROM produto WHERE id = %s"

    cursor.execute(sql, (id,))

    conexao.commit()

    cursor.close()
    conexao.close()

    return redirect(url_for('produtos'))


# Rodar servidor
if __name__ == '__main__':
    app.run(debug=True)