<section class="mini-layout">
    <div class="frame_title clearfix">
        <div class="pull-left">
            <span class="help-inline"></span>
            <span class="title">{lang('Email_template_editing')}</span>
        </div>
        <div class="pull-right">
            <div class="d-i_b">
                <a href="{$BASE_URL}admin/components/cp/cmsemail/index" class="t-d_n m-r_15 pjax">
                    <span class="f-s_14">←</span>
                    <span class="t-d_u">{lang('a_return')}</span>
                </a>
                <button type="button" class="btn btn-small formSubmit" data-form="#email_form" data-action="save">
                    <i class="icon-ok"></i>{lang('a_save')}
                </button>
                <button type="button" class="btn btn-small formSubmit" data-form="#email_form" data-action="tomain">
                    <i class="icon-edit"></i>{lang('a_save_and_exit')}
                </button>
            </div>
        </div>
    </div>
    <div class="content_big_td row-fluid">
        <div class="clearfix">
            <div class="btn-group myTab m-t_20 pull-left" data-toggle="buttons-radio">
                <a href="#settings" class="btn btn-small active" onclick="EmailTemplateVariables.updateVariablesList($(this), '{$model['id']}')">{lang('Template_settings')}</a>
                <a href="#variables" class="btn btn-small">{lang('Template_variables')}</a>
            </div>
        </div>
        <div class="tab-content">
            <div class="tab-pane active" id="settings">
                <div class="inside_padd">
                    <form action="{$BASE_URL}admin/components/cp/cmsemail/edit/{$model['id']}" id="email_form" method="post" class="form-horizontal">
                        <table class="table table-striped table-bordered table-hover table-condensed content_big_td">
                            <thead>
                            <th>{lang('a_sett')}</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="inside_padd">
                                            <div class="row-fluid">
                                                <div class="control-group">
                                                    <label class="control-label" for="comcount">{lang('Template_name_only_latin')}:</label>
                                                    <div class="controls">
                                                        <input id="comcount" type="text" name="mail_name" value="{$model['name']}" disabled="disabled"/>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="comcount2">{lang('From')}:</label>
                                                    <div class="controls">
                                                        <input id="comcount2" type="text" name="sender_name" value="{$model['from']}"/>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="comcount3">{lang('From_email')}:</label>
                                                    <div class="controls">
                                                        <input id="comcount3" type="text" name="from_email" value="{$model['from_email']}"/>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="comcount4">{lang('Theme')}:</label>
                                                    <div class="controls">
                                                        <input id="comcount4" type="text" name="mail_theme" value="{$model['theme']}"/>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="comcount5">{lang('Message_type')}:</label>
                                                    <div class="controls">
                                                        &nbsp; HTML &nbsp;
                                                        <span class="frame_label">
                                                            <span class="niceRadio b_n">
                                                                <input type="radio" name="mail_type" value="html" {if $model['type'] == 'HTML'}checked="checked"{/if} id="comcount5"/>
                                                            </span>
                                                        </span>
                                                        &nbsp; Text &nbsp;
                                                        <span class="frame_label">
                                                            <span class="niceRadio b_n">
                                                                <input type="radio" name="mail_type" value="text" {if $model['type'] == 'Text'}checked="checked"{/if} id="comcount5"/>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="userMailText">{lang('Template_user_mail')}:
                                                        </br>&nbsp;
                                                        <select name="mail_variables[]" multiple="multiple" id="userMailVariables" size="20">
                                                            {foreach $variables as $variable => $variableValue}
                                                                 <option title="{echo $variableValue}" value="{echo $variable}">{echo $variableValue}</option>
                                                            {/foreach}
                                                        </select>
                                                    </label>
                                                    <div class="controls">
                                                        <textarea class="elRTE" name="userMailText" id="userMailText">{$model['user_message']}</textarea>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="userMailTextRadio">{lang('Send_email_to_user')}:</label>
                                                    <div class="controls">
                                                        &nbsp; {lang('Yes')} &nbsp;
                                                        <span class="frame_label">
                                                            <span class="niceRadio b_n">
                                                                <input type="radio" name="userMailTextRadio" value="1" {if $model['user_message_active']}checked="checked"{/if} id="userMailTextRadio"/>
                                                            </span>
                                                        </span>
                                                        &nbsp; {lang('No')} &nbsp;
                                                        <span class="frame_label">
                                                            <span class="niceRadio b_n">
                                                                <input type="radio" name="userMailTextRadio" value="0" {if !$model['user_message_active']}checked="checked"{/if} id="userMailTextRadio"/>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="adminMailText">{lang('Template_admin_mail')}:
                                                        </br>&nbsp;
                                                        <select name="mail_variables[]" multiple="multiple" id="adminMailVariables" size="20">
                                                            {foreach $variables as $variable => $variableValue}
                                                                 <option title="{echo $variableValue}" value="{echo $variable}">{echo $variableValue}</option>
                                                            {/foreach}
                                                        </select>
                                                    </label>
                                                    <div class="controls">
                                                        <textarea class="elRTE" name="adminMailText" id="adminMailText">{$model['admin_message']}</textarea>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="adminMailTextRadio">{lang('Send_email_to_admin')}:</label>
                                                    <div class="controls">
                                                        &nbsp; {lang('Yes')} &nbsp;
                                                        <span class="frame_label">
                                                            <span class="niceRadio b_n">
                                                                <input type="radio" name="adminMailTextRadio" value="1" {if $model['admin_message_active']}checked="checked"{/if} id="adminMailTextRadio"/>
                                                            </span>
                                                        </span>
                                                        &nbsp; {lang('No')} &nbsp;
                                                        <span class="frame_label">
                                                            <span class="niceRadio b_n">
                                                                <input type="radio" name="adminMailTextRadio" value="0" {if !$model['admin_message_active']}checked="checked"{/if} id="adminMailTextRadio"/>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="comcount3">{lang('Admin_address')}:</label>
                                                    <div class="controls">
                                                        <input id="comcount3" type="text" name="admin_email" value="{$model['admin_email']}"/>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="symcount2">{lang('Template_description')}:</label>
                                                    <div class="controls">
                                                        <textarea class="elRTE" name="mail_desc" id="symcount2">{$model['description']}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        {form_csrf()}
                    </form>

                </div>
            </div>
            <div class="tab-pane active" id="variables">

                <div class="inside_padd">
                    <table class="table table-striped table-bordered table-hover table-condensed content_big_td variablesTable">
                        <thead>
                        <th>{lang('Variables')}</th>
                        <th>{lang('Values')}</th>
                        <th class="span2">{lang('Edit')}</th>
                        <th class="span1">{lang('Delete')}</th>
                        </thead>
                            {foreach $variables as $variable => $variable_value}
                                <tr>
                                    <td>
                                        <div class="variable">
                                            {echo $variable}
                                        </div>
                                        <input type="text" name="variableEdit" class="variableEdit" style="display: none"/>
                                    </td>
                                    <td>
                                        <div class="variableValue">
                                            {echo $variable_value}
                                        </div>
                                        <input type="text" name="variableValueEdit" class="variableValueEdit" style="display: none"/>
                                    </td>
                                    <td class="span1">
                                        <button class="btn my_btn_s btn-small btn-success editVariable" type="button">
                                            <i class="icon-edit"></i>
                                        </button>
                                        <button data-update="count" onclick="EmailTemplateVariables.update($(this), '{$model['id']}', '{echo $variable}')" class="btn btn-small refreshVariable" type="button" style="display: none;">
                                            <i class="icon-refresh"></i>
                                        </button>
                                    </td>
                                    <td class="span1">
                                        <button class="btn my_btn_s btn-small btn-danger " type="button" onclick="EmailTemplateVariables.delete({$model['id']}, '{echo $variable}', $(this))">
                                            <i class="icon-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            {/foreach}
                            <tr class="addVariableContainer" style="display: none">
                                <td class="span10">
                                    <input type="text" name="variableEdit" class="variableEdit"/>
                                </td>
                                <td class="span10">
                                    <input type="text" name="variableValueEdit" class="variableValueEdit"/>
                                </td>
                                <td  class="span5" colspan="2">
                                    <button data-update="count" onclick="EmailTemplateVariables.add($(this), {$model['id']})"  class="btn btn-small" type="button" style="display: block; margin-top: 4px;margin-left: 4px">
                                        <i class="icon-plus"></i>
                                    </button>
                                </td>
                            </tr>
                    </table>
                    <button  class="btn btn-small btn-success addVariable">
                        <i class="icon-plus icon-white"></i>&nbsp;{lang('Add_new_variable')}
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>