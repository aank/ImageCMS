function change_status(hrefFn) {
    $.post(hrefFn, {}, function(data) {
        $('.notifications').append(data)
    })
}
function export_csv(){
    $('.export').unbind('click').live('click', function(){ 

        if ($('input[name=export]:checked').val() == 'csv') {
            
            $('#exportUsers').submit();

            return false;
        }
    });
}

$(document).ajaxComplete( function(event, XHR, ajaxOptions){
    export_csv();
});

$(document).ready(function(){
    export_csv();

    $('#role_id').live('change', function(){
        var $roleId = $(this).find('option:selected').val();
        
        $.ajax({            
            dataType: "html",
            url: '/admin/components/cp/user_manager/getRolesTable/'+$roleId,
            success: function(msg) {
                $('#privilege').html(msg);                
            }
        });
    })
    $(".selValitadot").click(function() {
        

        $("#validatorSelect").show();
    });
    $(".selValitadot1").click(function() {

        $("#validatorSelect").hide();
    });

    
    $('#emailAutoC').autocomplete({
        minChars: 0,
        source: '/admin/components/cp/user_manager/auto_complit/email' + $('#emailAutoC').attr('value') + '?limit=15'
    });
    
    $('#nameAutoC').autocomplete({
        minChars: 0,
        source: '/admin/components/cp/user_manager/auto_complit/name' + $('#nameAutoC').attr('value') + '?limit=15'
        
    });

    $('.clearCashe').on('click', function() {
        $this = $(this);
        $.ajax({
            type: 'post',
            dataType: 'json',
            data: 'param=' + $this.attr('data-param'),
            url: $this.data('target'),
            success: function(obj) {
                console.log(obj.color);
                if (obj.result == true)
                    showMessage(obj.message, '', obj.color);
                else
                    showMessage(obj.message, '', obj.color);
                console.log(obj.fileCount);
                $('.filesCount').text(obj.filesCount);
            }
        });
    })

    $('.saveButton').live('click', function() {
        var idMenu = $(this).attr('idMenu');
        $.ajax({
            type: 'post',
            dataType: 'json',
            data: $('.saveForm').serialize(),
            url: '/admin/components/cp/menu/update_menu/' + idMenu,
            success: function(obj) {
                console.log(obj.color);
                if (obj.result == true)
                    showMessage(obj.title, obj.message);
                else
                    showMessage(obj.title, obj.message, 'r');

            }
        });

    });


    $('.createMenu').live('click', function() {
        $.ajax({
            type: 'post',
            dataType: 'json',
            data: $('.createMenuForm').serialize(),
            url: '/admin/components/cp/menu/create_menu/',
            success: function(obj) {

                if (obj.result == true) {

                    var url = '/admin/components/cp/menu/';
                    redirect_url(url);
                    showMessage(obj.title, obj.message);

                } else {

                    showMessage(obj.title, obj.message, 'r');
                }


            }
        });

    });

});


var delete_function = new Object({

    deleteFunction: function() {
        if ($('#banner_del').hasClass('disabled')) {
            return false;
        }
        if ($('#del_sel_property').hasClass('disabled')) {
            return false;
        }
        if ($('#del_sel_brand').hasClass('disabled')) {
            return false;
        }
        if ($('#del_sel_cert').hasClass('disabled')) {
            return false;
        }
        if ($('#module_delete').hasClass('disabled')) {
            return false;
        }
        if ($('#del_sel_wid').hasClass('disabled')) {
            return false;
        }
        if ($('#del_sel_pm').hasClass('disabled')) {
            return false;
        }
        if ($('#del_sel_warehouse').hasClass('disabled')) {
            return false;
        }
        if ($('#del_sel_role').hasClass('disabled')) {
            return false;
        }
        if ($('#user_del').hasClass('disabled')) {
            return false;
        }
        if ($('#del_in_search').hasClass('disabled')) {
            return false;
        }
        $('.modal_del').modal();
        
    },
    deleteFunctionConfirm: function(href)
    {
        var ids = new Array();
        $('input[name=ids]:checked').each(function() {
            ids.push($(this).val());
        });
        $.post(href, {
            ids: ids
        }, function(data) {
            $('#mainContent').after(data);
            $.pjax({
                url: window.location.pathname,
                container: '#mainContent'
            });
        });
        $('.modal_del').modal('hide');
        return true;
    }

});

var delete_functionS = new Object({

    deleteFunctionS: function() {
        if ($('#group_del').hasClass('disabled')) {
            return false;
        }
        $('.modal_dels').modal();
    },
    
    deleteFunctionConfirmS: function(href)
    {
        var ids = new Array();
        $('input[name=ids]:checked').each(function() {
            ids.push($(this).val());
        });
        $.post(href, {
            ids: ids
        }, function(data) {
            $('#mainContent').after(data);
            $.pjax({
                url: window.location.pathname,
                container: '#mainContent'
            });
        });
        $('.modal_dels').modal('hide');
        return true;
    }

});


var delete_currency_function = new Object({
    deleteFunction: function(cid) {
        $('#first').modal();
        id = cid;
        return id;
    },
    deleteFunctionConfirm: function(href)
    {
        var ids = new Array();
        ids = id;

        $.post(href, {
            ids: ids
        }, function(data) {
            if (data.recount) {
                $('#recount').modal();
                return false;
            }
            if (data.success) {
                $('#currency_tr' + id).remove();
            }
            $('.notifications').append(data.response);
        }, "json");
        $('#first').modal('hide');
        return true;
    },
    ajaxRecount: function(url) {
        $.ajax({
            type: "post",
            data: "id=" + id,
            url: url,
            success: function(data) {
                $('#mainContent').after(data);
                if (data.success) {
                    $('#currency_tr' + id).remove();
                }
            }
        });
        $('#recount').modal('hide');
        return true;
    }



});