package controllers

import (
	"net/http"

	"github.com/gernest/utron/controller"
)

//comments
type Accounting struct {
	controller.BaseController
	Routes []string
}

//comments
func (t *Accounting) Accounts() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "accounting/accountingHTML"
	t.HTML(http.StatusOK)
}

//comments
func (t *Accounting) Stores() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "accounting/accountingHTML"
	t.HTML(http.StatusOK)
}

//comments
func (t *Accounting) Machines() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "accounting/accountingHTML"
	t.HTML(http.StatusOK)
}

//comments
func NewAccounting() controller.Controller {
	return &Accounting{
		Routes: []string{
			"get;/accounting/machines;Machines",
			"get;/accounting/accounts;Accounts",
			"get;/accounting/stores;Stores",
		},
	}
}
