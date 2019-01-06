
function confirmardelete(iddetalle) {
    console.log(iddetalle);
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
                    iddetalle: iddetalle
                };

                $.ajax({
                    type: "Post",
                    url: "edit.aspx/DeletedetalleClick",
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