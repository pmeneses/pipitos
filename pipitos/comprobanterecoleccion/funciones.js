function confirmardelete(idrecolecta) {
    console.log(idrecolecta);
    event.preventDefault();
    swal({
        title: "Comprobante de recolección",
        text: "¿Desea eliminar el registro?",
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
                    idrecolecta: idrecolecta
                };

                $.ajax({
                    type: "Post",
                    url: "edit.aspx/Deleterecolecta",
                    data: JSON.stringify(datos),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        console.log(r.d);
                        if (r.d.tipo === 'error')
                            toastr.error(r.d.texto, 'Sistema');
                        if (r.d.tipo === 'success') {
                            toastr.success(r.d.texto, 'Sistema');
                            setTimeout(() => {
                                $("input[id$='btnrefresh'").click();
                            }, 1000);
                        }
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

function eliminardesecho(iddesecho) {
    console.log(iddesecho);
    event.preventDefault();
    swal({
        title: "Comprobante de recolección",
        text: "¿Desea eliminar el registro?",
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
                    iddesecho: iddesecho
                };
                $.ajax({
                    type: "Post",
                    url: "edit.aspx/Deletedesecho",
                    data: JSON.stringify(datos),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        console.log(r.d);
                        if (r.d.tipo === 'error')
                            toastr.error(r.d.texto, 'Sistema');
                        if (r.d.tipo === 'success') {
                            toastr.success(r.d.texto, 'Sistema');
                            setTimeout(() => {
                                $("input[id$='btnrefresh'").click();
                            }, 1000);
                        }
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