package controllers

import (
	"net/http"

	"github.com/gernest/utron/controller"
)

//comments
type Reports struct {
	controller.BaseController
	Routes []string
}

//comments
func (t *Reports) Jackpot() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "reports/jackpotHTML"
	t.HTML(http.StatusOK)
}

//comments
func (t *Reports) Machines() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "reports/machinesHTML"
	t.HTML(http.StatusOK)
}

//comments
func (t *Reports) Revenue() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "reports/revenueHTML"
	t.HTML(http.StatusOK)
}

//comments
func (t *Reports) Behavior() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "reports/behaviorHTML"
	t.HTML(http.StatusOK)
}

//comments
func NewReports() controller.Controller {
	return &Reports{
		Routes: []string{},
	}
}
