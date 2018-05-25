package controllers

import (
	"net/http"

	common "awpbackend/common"
	m "awpbackend/models"

	"github.com/gernest/utron/controller"
)

//Todo is a controller for Todo list
type Common struct {
	controller.BaseController
	Routes []string
}

//Home renders a todo list
func (t *Common) GetPermissionList() {
	p := common.Permissions()
	t.RenderJSON(m.BoxingToResult(p, nil), http.StatusOK)
}

//Home renders a todo list
func (t *Common) GeUsersTree() {
	// req := t.Ctx.Request()
	t.RenderJSON(m.GetUsersTree(), http.StatusOK)
}

//NewTodo returns a new  todo list controller
func NewCommon() controller.Controller {
	return &Common{
		Routes: []string{
			"get;/api/common/permissionlist;GetPermissionList",
			"get;/api/common/getuserstree;GeUsersTree",
		},
	}
}
