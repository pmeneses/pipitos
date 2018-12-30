function confirmardelete(idruta) {
    console.log(idruta);
    event.preventDefault();
    swal({
        title: "Rutas",
        text: "¿Desea eliminar la ruta?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si",
        cancelButtonText: "No",
        closeOnConfirm: true,
        closeOnCancel: true
    },
        function (isConfirm) {
            if (isConfirm) {
                var datos = {
                    idruta: idruta
                };

                $.ajax({
                    type: "Post",
                    url: "Index.aspx/DeleteClick",
                    data: JSON.stringify(datos),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        console.log(r.d);
                        if (r.d.tipo === 'error')
                            toastr.error(r.d.texto, 'Sistema');
                        if (r.d.tipo === 'success')
                            location.reload(true);
                    },
                    error: function (xhr, textStatus, errorThrown) {
                        toastr.error(errorThrown, 'Sistema');
                    }
                });
            }
            else {
                toastr.info("La operación fue cancelada", "Sistema");
                return false;
            }
        });
}

// Call the dataTables jQuery plugin
$(document).ready(function () {
    $('[id*=gvrutas]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
        "bDestroy": true,
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
});
