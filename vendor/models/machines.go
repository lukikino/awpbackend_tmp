package models

import (
	"fmt"
	"strings"

	_ "github.com/go-sql-driver/mysql"
)

type MachineTransfer struct {
	Machines []string `json:machines`
	Account  int      `json:account`
}

type Machine struct {
	ID          int    `db:"id" json:"ID"`
	StoreName   string `db:"store_name" json:"storeName"`
	MachineName string `db:"machine_name" json:"machineName"`
	PCBID       string `db:"pcb_id" json:"pcbID"`
	UserID      int    `db:"user_id" json:"userID"`
	CreatedTime string `db:"created_time" json:"createdTime"`
	UpdateTime  string `db:"update_time" json:"updateTime"`
	Total       int    `db:"total" json:"total"`
}

// type MachineWithUser struct {
// 	UserID   int                `json:"userID"`
// 	Machines []Machine          `json:"machines"`
// 	Children []*MachineWithUser `json:"children"`
// 	ParentID int
// }

type machineUser struct {
	MachineID   int    `db:"machine_id" json:"machineID"`
	MachineName string `db:"machine_name" json:"machineName"`
	StoreName   string `db:"store_name" json:"storeName"`
	PCBID       string `db:"pcb_id" json:"pcbID"`
	UserID      int    `db:"user_id" json:"userID"`
	Account     string `db:"account" json:"account"`
	ParentID    int    `db:"parent_id" json:"parentID"`
}

func GetMachines() ReturnData {
	db := GetConnection()
	mm := []Machine{}
	err := db.Select(&mm, "call sp_getMachines(?)", 2)
	returnData := BoxingToResult(mm, err)
	return returnData
}

func GetMachinesWithUsers() ReturnData {
	db := GetConnection()
	ma := []machineUser{}
	err := db.Select(&ma, "call sp_getMachinesWithUsers(?)", 2)
	/*
		// nmList := []*MachineWithAccount{}
		// for _, row := range ma {
		// 	var nmp *MachineWithAccount
		// 	nm := MachineWithAccount{UserID: row.UserID, Machines: []Machine{}, ParentID: row.ParentID, Children: []*MachineWithAccount{}}
		// 	m := Machine{PCBID: row.PCBID, StoreName: row.StoreName, MachineName: row.MachineName, ID: row.MachineID}
		// 	nmp = &nm
		// 	//find exist account node and append machine to.
		// 	for _, v := range nmList {
		// 		if v.UserID == row.UserID {
		// 			nmp = v
		// 			break
		// 		}
		// 	}
		// 	if m.ID > 0 {
		// 		nmp.Machines = append(nmp.Machines, m)
		// 	}
		// 	nmList = append(nmList, nmp)
		// }
		// for _, p := range nmList {
		// 	//find parent and create tree
		// 	for _, v := range nmList {
		// 		if v.UserID == p.ParentID {
		// 			p.Children = append(p.Children, v)
		// 		}
		// 	}
		// }
	*/
	returnData := BoxingToResult(ma, err)
	return returnData
}

func TransferMachines(transferData MachineTransfer) ReturnData {
	db := GetConnection()
	var count int64
	machines := strings.Trim(strings.Join(strings.Fields(fmt.Sprint(transferData.Machines)), ","), "[]")
	err := db.Get(&count, "call sp_transferMachines(?,?,?)", 2, machines, transferData.Account)
	returnData := BoxingToResult(count, err)
	return returnData
}

func GetMachine(id string) ReturnData {
	db := GetConnection()
	m := Machine{}
	err := db.Get(&m, "call sp_getMachine(?)", id)
	returnData := BoxingToResult(m, err)
	return returnData
}

func EditMachine(id string, data Machine) ReturnData {
	db := GetConnection()
	var count int64
	res, err := db.Exec("call sp_editMachine(?,?,?)", id, data.StoreName, data.UserID)
	if err == nil {
		count, _ = res.RowsAffected()
	}
	returnData := BoxingToResult(count, err)
	return returnData
}

func DeleteMachine(id string) ReturnData {
	db := GetConnection()
	var count int64 = 0
	res, err := db.Exec("call sp_deleteMachine(?)", id)
	if err == nil {
		count, _ = res.RowsAffected()
	}
	returnData := BoxingToResult(count, err)
	return returnData
}

func AddMachine(data Machine) ReturnData {
	db := GetConnection()
	var count int64 = 0
	res, err := db.Exec("call sp_addMachine(?,?,?)", data.PCBID, data.StoreName, data.UserID)
	if err == nil {
		count, _ = res.RowsAffected()
	}
	returnData := BoxingToResult(count, err)
	return returnData
}
