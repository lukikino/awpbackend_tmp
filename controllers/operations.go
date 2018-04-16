package controllers

import (
	"net/http"

	"github.com/gernest/utron/controller"
)

//comments
type Operation struct {
	controller.BaseController
	Routes []string
}

//comments
func (t *Operation) Day() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "operations/operationsHTML"
	t.HTML(http.StatusOK)
}

//comments
func (t *Operation) Week() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "operations/operationsHTML"
	t.HTML(http.StatusOK)
}

//comments
func (t *Operation) Month() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "operations/operationsHTML"
	t.HTML(http.StatusOK)
}

//comments
func (t *Operation) Machines() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "operations/operationsHTML"
	t.HTML(http.StatusOK)
}

//comments
func NewOperations() controller.Controller {
	return &Operation{
		Routes: []string{
			"get;/operations/day;Day",
			"get;/operations/week;Week",
			"get;/operations/month;Month",
			"get;/operations/machines;Machines",
		},
	}
}
