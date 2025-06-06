<!DOCTYPE html>i
<html>
<head>
    <meta charset="UTF-8">
    <title>Conversiones de Moneda</title>
     <script src="http://40.0.0.71/opentaps_images/resources/js/vue.js"></script>
<script src="http://40.0.0.71/opentaps_images/resources/js/axios.js"></script>

   
    <style>
        .seccion-verde {
            background-color:#235B4E !important;
            color: white;
            padding: 8px;
            font-weight: bold;
            border-radius: 4px 4px 0 0;
        }
 
        .tabla-scroll {
            max-height: 300px;
            overflow-y: auto;
            border: 1px solid #ccc;
            border-top: none;
        }
 
        table {
            width: 100%;
            border-collapse: collapse;
        }
 
        th {
            background-color:#235B4E !important;
            color: white;
            padding: 8px;
            text-align: left;
            position: sticky;
            top: 0;
            z-index: 1;
        }
 
        td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
 
        .separador {
          margin-bottom: 30px;
        }
 
        hr.division {
          border: 0;
          height: 2px;
          background-color:#235B4E !important;
          margin: 30px 0;
        }
    </style>
</head>
 
<body>
<div id="app1">
    <div class="seccion-verde">Conversiones de Moneda</div>
    <div class="scrollable-table separador">
      <div class="tabla-scroll">
        <table>
            <thead>
                <tr>
                    <th style="color: white; font-size: 14px;">De Moneda</th>
                    <th style="color: white; font-size: 14px;">A Moneda</th>
                    <th style="color: white; font-size: 14px;">Tasa</th>
                    <th style="color: white; font-size: 14px;">Desde</th>
                    <th style="color: white; font-size: 14px;">Hasta</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="conversion in conversiones" :key="conversion.de_moneda + conversion.a_moneda + conversion.desde">
                    <td>{{ conversion.de_moneda }}</td>
                    <td>{{ conversion.a_moneda }}</td>
                    <td>{{ formatTasa(conversion.tasa) }}</td>
                    <td>{{ formatFecha(conversion.desde) }}</td>
                    <td>{{ formatFecha(conversion.hasta) }}</td>
                </tr>
            </tbody>
        </table>
      </div>
    </div>
</div>
 
<!-- Línea divisoria opcional -->
<hr class="division">
 
<script>
new Vue({
    el: '#app1',
    data: {
        conversiones: []
    },
    mounted() {
        axios.get('http://40.0.0.71:3000/conversiones-monedas')
            .then(response => {
                this.conversiones = response.data;
            })
            .catch(error => {
                console.error('Error al obtener las conversiones:', error);
            });
    },
    methods: {
        formatFecha(fecha) {
            if (!fecha || new Date(fecha).getFullYear() === 1969) {
                return '';
            }
            return new Date(fecha).toLocaleDateString('es-MX');
        },
        formatTasa(tasa) {
            return parseFloat(tasa).toFixed(4);
        }
    }
});
</script>
</body>
</html>
 
