

module "web_app" {
    source        = "../../modules/web_app"

    asp_name      = var.asp_name
    web_app_name  = var.web_app_name
    sku_name      = var.web_sku_name
}