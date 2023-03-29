

module "win_function_app" {
    source = "../../modules/win_function_app"

    sp_name = var.sp_name
    fn_name = var.fn_name
    sa_name = var.new_storage_name

}