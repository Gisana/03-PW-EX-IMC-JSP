<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exemplo JSP</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
    <div class="col-md-12">
        <div class="modal-dialog" style="margin-bottom:0">
            <div class="modal-content">
                <div class="panel-heading">
                    <h3 class="panel-title">Calculadora IMC</h3>
                </div>
                <div class="panel-body">
                    <form name="formulario">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Peso (kg)" name="peso" type="peso" autofocus="">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Altura (m)" name="altura" type="text" autofocus="">
                            </div>
                            <div class="form-group">
                                <label for="exampleSelect1">Sexo</label>
                                <select class="form-control" id="sexo">
                                    <option>Feminino</option>
                                        <option>Masculino</option>
                                </select>
                            </div>
                            <button class="btn btn-sm btn-success">Calcular</button>
                        </fieldset>
                    </form>
                </div>
                <%!Float imc(Float altura, Float peso) {
                    return peso/(altura*altura);
                }%>

                    <%
                    String alturaStr = request.getParameter("altura");
                    String pesoStr = request.getParameter("peso");
                    String sexoStr = request.getParameter("sexo");

                    alturaStr = alturaStr == null ? "1" : alturaStr;                    
                    pesoStr = pesoStr == null ? "0" : pesoStr;

                    Float altura = Float.parseFloat(alturaStr);
                    Float peso = Float.parseFloat(pesoStr);

                    Float resimc = imc(altura,peso);
                    
                    String resultado = "";
                    
                    if(resimc<18.5)
                        resultado = "Voce esta magro";                    
                    else
                        if(resimc>=18.5 && resimc<24.9)
                            resultado = "Voce esta normal";                   
                        else
                            if(resimc>=25 && resimc<29.9)
                                resultado = "Voce esta com sobre peso";                    
                            else
                                if(resimc>=30 && resimc<39.9)
                                    resultado = "Voce esta com obesidade";                 
                                else
                                    if(resimc>40) 
                                        resultado = "Voce esta com obesidade grave";               
            %>

                        <div class="alert alert-success" role="alert" style="margin-top:45px">
                            <%=resultado%>
                        </div>



</body>

</html>