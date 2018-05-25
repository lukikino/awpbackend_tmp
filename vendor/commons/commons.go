package commons

import (
	"reflect"
	"strings"
)

type UtilFuncs interface {
	Permissions() PermissionEnum
}

var (
	permissionEnum PermissionEnum
)

// var Enumss UtilFuncs = enumss{}

type enums struct{}

func Permissions() PermissionEnum {
	if (PermissionEnum{}) == permissionEnum {
		permissionEnum = PermissionEnum{
			Accounting:      PermissionEnumAction{View: "active"},
			Operations:      PermissionEnumAction{View: "active"},
			Transactions:    PermissionEnumAction{View: "active"},
			MachineList:     PermissionEnumAction{View: "active", Create: "active", Edit: "active", Delete: "active"},
			MachineTransfer: PermissionEnumAction{View: "active", Edit: "active"},
			CoreUser:        PermissionEnumAction{View: "active", Create: "active", Edit: "active", Delete: "active"},
			Agency:          PermissionEnumAction{View: "active", Create: "active", Edit: "active", Delete: "active"},
			VersionSetting:  PermissionEnumAction{View: "active", Edit: "active"},
			JPStatus:        PermissionEnumAction{View: "active"},
		}
		v := reflect.ValueOf(&permissionEnum)
		for i := 0; i < v.Elem().Type().NumField(); i++ {
			v2 := v.Elem().Field(i)
			for j := 0; j < v2.Type().NumField(); j++ {
				if v2.Field(j).String() != "" {
					v2.Field(j).SetString(strings.ToLower(v.Elem().Type().Field(i).Name) + "_" + strings.ToLower(v2.Type().Field(j).Name))
				}
			}
		}
	}
	return permissionEnum
}

type PermissionEnum struct {
	Accounting      PermissionEnumAction `json:"accounting"`
	Operations      PermissionEnumAction `json:"operations"`
	Transactions    PermissionEnumAction `json:"transactions"`
	MachineList     PermissionEnumAction `json:"machineList"`
	MachineTransfer PermissionEnumAction `json:"machineTransfer"`
	CoreUser        PermissionEnumAction `json:"coreUser"`
	Agency          PermissionEnumAction `json:"agency"`
	VersionSetting  PermissionEnumAction `json:"versionSetting"`
	JPStatus        PermissionEnumAction `json:"jpStatus"`
}

type PermissionEnumAction struct {
	Create string `json:"create"`
	View   string `json:"view"`
	Edit   string `json:"edit"`
	Delete string `json:"delete"`
}
