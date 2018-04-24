<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina inicial</title>
    </head>
    <body>
        <h1>Processador de Emails</h1>
        <form action="processarMail" method="post">
            Mensagem:<input type="text" name="mensagem" />
            <input type="submit" value="Enviar email"/>
        </form>
    </body>
</html>
