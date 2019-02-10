function confirmardelete(id_donante) {
    console.log(id_donante);
    event.preventDefault();
    swal({
        title: "Rutas",
        text: "¿Desea eliminar el donante?",
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
                    id_donante: id_donante
                };

                $.ajax({
                    type: "Post",
                    url: "index.aspx/DeleteDonante",
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