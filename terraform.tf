terraform {
  required_providers {
    wiz = {
      version = " ~> 1.10.1961"
      source  = "tf.app.wiz.io/wizsec/wiz"
    }
  }
}

provider "wiz" {}
