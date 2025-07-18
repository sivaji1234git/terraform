resource "azurerm_windows_virtual_machine_scale_set" "winvmss" {
  name                 = var.vmss_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  sku                  = var.sku
  instances            = 2
  admin_password       = var.password
  admin_username       = var.username
  computer_name_prefix = "vm-"

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "vmss-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }
}
resource "azurerm_monitor_autoscale_setting" "vmss_autoscale" {
  name                = "vmss-autoscale-profiles"
  resource_group_name = var.resource_group_name
  location            = var.location
  target_resource_id  = azurerm_windows_virtual_machine_scale_set.winvmss.id

  /*#### Notification Block#####
  notification {
    email {
      send_to_subscription_administrator    = true
      send_to_subscription_co_administrator = true

    }
  }*/
  #### Profile-1( Default Profile Block ) #####
  profile {
    name = "Default Profile"
    capacity {
      default = 2
      minimum = 2
      maximum = 6
    }

    ### Percentage CPU Metric Rule Begins #####
    ### Scale-Out Rule  ####
    rule {
      scale_action {
        direction = "Increase" # Scale-out means always increase
        type      = "ChangeCount"
        value     = 1
        cooldown  = "PT5M"
      }
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.winvmss.id
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
      }
    }

    ### Scale-In Rule ####
    rule {
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = 1
        cooldown  = "PT5M"
      }
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.winvmss.id
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }
    }

    ### END OF Percentage CPU Metric Rule ###

    ###########  START: Available Memory Bytes Metric Rules  ###########    
    ## Scale-Out 
    rule {
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = 1
        cooldown  = "PT5M"
      }
      metric_trigger {
        metric_name        = "Available Memory Bytes"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.winvmss.id
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 1073741824 # Increase 1 VM when Memory In Bytes is less than 1GB
      }
    }
    ## Scale-In 
    rule {
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = 1
        cooldown  = "PT5M"
      }
      metric_trigger {
        metric_name        = "Available Memory Bytes"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.winvmss.id
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 2147483648 # Decrease 1 VM when Memory In Bytes is Greater than 2GB
      }
    }
    ###########  END: Available Memory Bytes Metric Rules  ###########      

  } # End of Default Profile Block -1


}

