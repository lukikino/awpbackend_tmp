//go:generate stringer -type=TransactionType
//if modify const, run "go generate" in current floder
package transactiontype

type TransactionType int

// func (TransactionType) String() string

const (
	KeyIn   TransactionType = 1
	KeyOut  TransactionType = 2
	CoinIn  TransactionType = 3
	CoinOut TransactionType = 4
	Play    TransactionType = 5
)

var listTransactionTypes []ListTransactionTypes

func GetTransactionTypes() []ListTransactionTypes {
	if listTransactionTypes == nil {
		listTransactionTypes = []ListTransactionTypes{
			ListTransactionTypes{ID: (int)(KeyIn), Name: KeyIn.String()},
			ListTransactionTypes{ID: (int)(KeyOut), Name: KeyOut.String()},
			ListTransactionTypes{ID: (int)(CoinIn), Name: CoinIn.String()},
			ListTransactionTypes{ID: (int)(CoinOut), Name: CoinOut.String()},
			ListTransactionTypes{ID: (int)(Play), Name: Play.String()},
		}
	}
	return listTransactionTypes
}

type ListTransactionTypes struct {
	ID   int    `json:"ID"`
	Name string `json:"name"`
}
