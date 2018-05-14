const getTemplate = function (path, component) {
    return Vue.component(path.replace(/\//ig, '_'), function (resolve, reject) {
        Vue.http.get('/static/views/' + path + '.html').then(function (r) {
            component.template = r.body;
            component.delimiters = ['{/', '/}'];
            resolve(component);
        });
    });
}

var fakeData = { items: [] };
var fakeDataTotal = {};
for (var i = 1; i < 60; i++) {
    let item = {
        date: '2018/5/22',
        account: 'peter' + Math.floor(Math.random() * 10),
        storeName: 'Jungle' + Math.floor(Math.random() * 10),
        machineId: Math.floor(Math.random() * 10000000000),
        machineName: 'desert' + i,
        in: 998512 * i,
        out: 555222 * i,
        outRate: 555222 / 998512 * 100,
        bet: 458210 * i,
        win: 225895 * i,
        winRate: 225895 / 458210 * 100,
        playTimes: 7852 * i,
        winTimes: 5846 * i,
        hitRate: 5848 / 7855 * 100,
        time: '2018/5/22 20:20',
        avgBet: Math.floor(458210 / 7855)
    };
    fakeData.items.push(
        item
    );
    fakeDataTotal.in = (fakeDataTotal.in || 0) + item.in;
    fakeDataTotal.out = (fakeDataTotal.out || 0) + item.out;
    fakeDataTotal.bet = (fakeDataTotal.bet || 0) + item.bet;
    fakeDataTotal.win = (fakeDataTotal.win || 0) + item.win;
    fakeDataTotal.playTimes = (fakeDataTotal.playTimes || 0) + item.playTimes;
    fakeDataTotal.winTimes = (fakeDataTotal.winTimes || 0) + item.winTimes;
}
fakeDataTotal.outRate = fakeDataTotal.out / fakeDataTotal.in * 100;
fakeDataTotal.winRate = fakeDataTotal.win / fakeDataTotal.bet * 100;
fakeDataTotal.hitRate = fakeDataTotal.winTimes / fakeDataTotal.playTimes * 100;

var fakeTransactions = { items: [] };
for (var i = 1; i < 60; i++) {
    let item = {
        storeName: 'Jungle' + Math.floor(Math.random() * 10),
        machineId: Math.floor(Math.random() * 10000000000),
        machineName: 'desert' + i,
        transactionType: ['Play', 'Coin in'][Math.floor(Math.random() * 2)],
        gameType: ['Main Game', 'Free Game', 'Bonus Game'][Math.floor(Math.random() * 3)],
        startCredit: 99589,
        endCredit: 75882,
        in: 998512 * i,
        out: 555222 * i,
        bet: 458210 * i,
        win: 225895 * i,
        jpWin: 0,
        description: 'Game1',
        startSymbols: [1, 5, 8, 7, 9, 2, 10, 5, 7, 8, 10, 5, 9, 8, 6],
        resultSymbols: [1, 5, 8, 7, 9, 2, 10, 5, 7, 8, 10, 5, 9, 8, 6],
        ID: '215899545201',
        time: '2018/5/22 20:20:18'
    };
    fakeTransactions.items.push(item);
}

var fakeMachines = { items: [] };
for (var i = 1; i < 60; i++) {
    let item = {
        machineId: Math.floor(Math.random() * 10000000000),
        storeName: 'Jungle' + Math.floor(Math.random() * 10),
        machineName: 'Dialbo' + Math.floor(Math.random() * 10),
        status: [0, 1][Math.floor(Math.random() * 2)],
        lastConnectTime: '2018/5/2 21:00:58',
        currentVersion: '1.0.0.0',
        targetVersion: '1.1.0.0',
        id: 123456
    };
    fakeMachines.items.push(item);
}
var fakeAccounts = { items: [] };
for (var i = 1; i < 60; i++) {
    let item = {
        account: Math.floor(Math.random() * 10000000000),
        status: Math.floor(Math.random() * 3) + 1,
        createTime: '2020/5/5 12:55:12',
        id: 123456
    };
    fakeAccounts.items.push(item);
}

var common = {
    methods: {
        thousandFormat: function (v) {
            v = v || 0;
            return '$' + v.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        },
        percentageFormat: function (v) {
            v = v || 0;
            return v.toFixed(2) + "%";
        }
    }
}

Vue.component('dropdown', {
    delimiters: ['{/', '/}'],
    template: '#dropdown',
    props: ['items'],
    computed: {
        selectedLength: function () {
            return this.items.items.filter(function (v) { return v.check == true; }).length
        },
        allChecked: function () {
            return !this.items.items || this.selectedLength == this.items.items.length;
        },
        buttonText: function () {
            if (this.allChecked)
                return ['All ', this.items.type, 's'].join('');
            else
                return [(this.selectedLength > 0 ? this.selectedLength : ''), ' ', this.items.type, (this.selectedLength > 1 || this.selectedLength === 0 ? 's' : '')].join('');
        }
    },
    methods: {
        domId: function (id) {
            return this.items.type + id;
        },
        checkAll: function () {
            for (var index in this.items.items) {
                this.items.items[index].check = true;
            }
        },
        uncheckAll: function () {
            for (var index in this.items.items) {
                this.items.items[index].check = false;
            }
        }
    },
    mounted: function () {
        //prevent dropdown click close event (for bootstrap dropdown)
        $('.dropdown-menu').click(function (e) {
            e.stopPropagation();
        });
    }
});

const Home = {
    mixins: [common],
    data: function () {
        return {
            loading: false,
            summaryData: {
                today: {
                    Total_In: 0,
                    Total_Out: 0,
                    Out_Rate: 0,
                    Total_Bet: 0,
                    Total_Win: 0,
                    Win_Rate: 0,
                    Total_Play_Times: 0,
                    Total_Win_Times: 0,
                    Hit_Rate: 0
                },
                yesterday: {
                    Total_In: 0,
                    Total_Out: 0,
                    Out_Rate: 0,
                    Total_Bet: 0,
                    Total_Win: 0,
                    Win_Rate: 0,
                    Total_Play_Times: 0,
                    Total_Win_Times: 0,
                    Hit_Rate: 0
                },
                wtd: {
                    Total_In: 0,
                    Total_Out: 0,
                    Out_Rate: 0,
                    Total_Bet: 0,
                    Total_Win: 0,
                    Win_Rate: 0,
                    Total_Play_Times: 0,
                    Total_Win_Times: 0,
                    Hit_Rate: 0
                },
                mtd: {
                    Total_In: 0,
                    Total_Out: 0,
                    Out_Rate: 0,
                    Total_Bet: 0,
                    Total_Win: 0,
                    Win_Rate: 0,
                    Total_Play_Times: 0,
                    Total_Win_Times: 0,
                    Hit_Rate: 0
                }
            },
            topOutRate: {
                items: [
                    {
                        storeName: '-',
                        machine: '-',
                        value: 0
                    }
                ]
            },
            topWinRate: {
                items: [
                    {
                        storeName: '-',
                        machine: '-',
                        value: 0
                    }
                ]
            },
            topHitRate: {
                items: [
                    {
                        storeName: '-',
                        machine: '-',
                        value: 0
                    }
                ]
            },
            accounts: {
                type: "Account",
                items: []
            },
            stores: {
                type: "Store",
                items: []
            }
        }
    },
    computed: {
    },
    methods: {
        search: function () {
            let vm = this;
            this.loading = true;
            this.$http.get('/').then(function () {
                setTimeout(() => {
                    vm.loading = false;
                }, 2000);
            });
        }
    },
    created: function () {
        let vm = this;
        app.getAccounts((function (v) { this.accounts.items = v; }).bind(this));
        app.getStores((function (v) { this.stores.items = v; }).bind(this));

        this.$http.get('/api/index/dashboard').then(function (res) {
            vm.summaryData.today = res.body[0];
            vm.summaryData.yesterday = res.body[1];
            vm.summaryData.wtd = res.body[2];
            vm.summaryData.mtd = res.body[3];
        });
        this.$http.get('/api/index/topoutrate').then(function (res) {
            vm.topOutRate.items = res.body;
        });
        this.$http.get('/api/index/topwinrate').then(function (res) {
            vm.topWinRate.items = res.body;
        });
        this.$http.get('/api/index/tophitrate').then(function (res) {
            vm.topHitRate.items = res.body;
        });
    },
    mounted: function () {
    }
};

const Operations = {
    mixins: [common],
    data: function () {
        return {
            loading: false,
            searching: false,
            reportData: fakeData,
            reportDataTotal: fakeDataTotal,
            unit: 10,
            currentPage: 1,
            totalPage: 1,
            group: 3,
            view: 1,
            accounts: {
                type: "Account",
                items: []
            },
            stores: {
                type: "Store",
                items: []
            },
            machines: {
                type: "Machine",
                items: []
            }
        }
    },
    watch: {
        unit: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.reportData.items.length / this.unit);
        }
    },
    computed: {
        startRow: function () {
            let s = (this.currentPage - 1) * this.unit;
            if (this.reportData.items.length < s)
                s = this.reportData.items.length - 1;
            return s;
        },
        endRow: function () {
            let e = this.currentPage * this.unit;
            if (this.reportData.items.length < e)
                e = this.reportData.items.length;
            return e;
        },
        viewData: function () {
            let start = this.startRow;
            let end = this.endRow;
            return this.reportData.items.slice(start, end);
        }
    },
    methods: {
        changeGroup: function (group) {
            this.group = group;
            this.search();
        },
        chkGroup: function (group) {
            return group != this.group || 'active';
        },
        changeView: function (view) {
            let vm = this;
            vm.loading = true;
            setTimeout(() => {
                vm.loading = false;
                this.view = view;
            }, 500);
        },
        chkView: function (view) {
            return view != this.view || 'active';
        },
        chkPageCurrent: function (page) {
            return this.currentPage != page || 'current';
        },
        changePage: function (page) {
            let vm = this;
            vm.loading = true;
            setTimeout(() => {
                vm.loading = false;
                vm.currentPage = page;
            }, 300);
        },
        search: function () {
            let vm = this;
            vm.loading = true;
            vm.searching = true;
            vm.$http.get('/').then(function () {
                vm.totalPage = Math.ceil(vm.reportData.items.length / vm.unit);
                setTimeout(() => {
                    vm.loading = false;
                    vm.searching = false;
                }, 2000);
            });
        }
    },
    created: function () {
        app.getAccounts((function (v) { this.accounts.items = v; }).bind(this));
        app.getStores((function (v) { this.stores.items = v; }).bind(this));
        app.getMachines((function (v) { this.machines.items = v; }).bind(this));
    },
    mounted: function () {
        this.totalPage = Math.ceil(this.reportData.items.length / this.unit);
    }
};

const Accounting = {
    mixins: [common],
    data: function () {
        return {
            loading: false,
            searching: false,
            reportData: fakeData,
            reportDataTotal: fakeDataTotal,
            unit: 10,
            currentPage: 1,
            totalPage: 1,
            group: 3,
            view: 1,
            accounts: {
                type: "Account",
                items: []
            },
            stores: {
                type: "Store",
                items: []
            },
            machines: {
                type: "Machine",
                items: []
            }
        }
    },
    watch: {
        unit: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.reportData.items.length / this.unit);
        }
    },
    computed: {
        startRow: function () {
            let s = (this.currentPage - 1) * this.unit;
            if (this.reportData.items.length < s)
                s = this.reportData.items.length - 1;
            return s;
        },
        endRow: function () {
            let e = this.currentPage * this.unit;
            if (this.reportData.items.length < e)
                e = this.reportData.items.length;
            return e;
        },
        viewData: function () {
            let start = this.startRow;
            let end = this.endRow;
            return this.reportData.items.slice(start, end);
        }
    },
    methods: {
        changeGroup: function (group) {
            this.group = group;
            this.search();
        },
        chkGroup: function (group) {
            return group != this.group || 'active';
        },
        changeView: function (view) {
            let vm = this;
            vm.loading = true;
            setTimeout(() => {
                vm.loading = false;
                this.view = view;
            }, 500);
        },
        chkView: function (view) {
            return view != this.view || 'active';
        },
        chkPageCurrent: function (page) {
            return this.currentPage != page || 'current';
        },
        changePage: function (page) {
            let vm = this;
            vm.loading = true;
            setTimeout(() => {
                vm.loading = false;
                vm.currentPage = page;
            }, 300);
        },
        search: function () {
            let vm = this;
            vm.loading = true;
            vm.searching = true;
            vm.$http.get('/').then(function () {
                vm.totalPage = Math.ceil(vm.reportData.items.length / vm.unit);
                setTimeout(() => {
                    vm.loading = false;
                    vm.searching = false;
                }, 2000);
            });
        }
    },
    created: function () {
        app.getAccounts((function (v) { this.accounts.items = v; }).bind(this));
        app.getStores((function (v) { this.stores.items = v; }).bind(this));
        app.getMachines((function (v) { this.machines.items = v; }).bind(this));
    },
    mounted: function () {
        this.totalPage = Math.ceil(this.reportData.items.length / this.unit);
    }
};

const Transactions = {
    mixins: [common],
    data: function () {
        return {
            loading: false,
            searching: false,
            reportData: fakeTransactions,
            unit: 10,
            currentPage: 1,
            totalPage: 1,
            view: 1,
            accounts: {
                type: "Account",
                items: []
            },
            stores: {
                type: "Store",
                items: []
            },
            machines: {
                type: "Machine",
                items: []
            },
            transactionTypes: {
                type: "Transaction Type",
                items: []
            },
            gameTypes: {
                type: "Game Type",
                items: []
            }
        }
    },
    watch: {
        unit: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.reportData.items.length / this.unit);
        }
    },
    computed: {
        startRow: function () {
            let s = (this.currentPage - 1) * this.unit;
            if (this.reportData.items.length < s)
                s = this.reportData.items.length - 1;
            return s;
        },
        endRow: function () {
            let e = this.currentPage * this.unit;
            if (this.reportData.items.length < e)
                e = this.reportData.items.length;
            return e;
        },
        viewData: function () {
            let start = this.startRow;
            let end = this.endRow;
            return this.reportData.items.slice(start, end);
        }
    },
    methods: {
        changeView: function (view) {
            let vm = this;
            vm.loading = true;
            setTimeout(() => {
                vm.loading = false;
                this.view = view;
            }, 500);
        },
        chkView: function (view) {
            return view != this.view || 'active';
        },
        chkPageCurrent: function (page) {
            return this.currentPage != page || 'current';
        },
        changePage: function (page) {
            let vm = this;
            vm.loading = true;
            setTimeout(() => {
                vm.loading = false;
                vm.currentPage = page;
            }, 300);
        },
        search: function () {
            let vm = this;
            vm.loading = true;
            vm.searching = true;
            vm.$http.get('/').then(function () {
                vm.totalPage = Math.ceil(vm.reportData.items.length / vm.unit);
                setTimeout(() => {
                    vm.loading = false;
                    vm.searching = false;
                }, 2000);
            });
        }
    },
    created: function () {
        app.getAccounts((function (v) { this.accounts.items = v; }).bind(this));
        app.getStores((function (v) { this.stores.items = v; }).bind(this));
        app.getMachines((function (v) { this.machines.items = v; }).bind(this));
        app.getTransactionTypes((function (v) { this.transactionTypes.items = v; }).bind(this));
        app.getGameTypes((function (v) { this.gameTypes.items = v; }).bind(this));
    },
    mounted: function () {
        this.totalPage = Math.ceil(this.reportData.items.length / this.unit);
    }
};

const MachineList = {
    mixins: [common],
    data: function () {
        return {
            loading: false,
            filter: '',
            machines: { items: [] },
            unit: 10,
            currentPage: 1,
            totalPage: 1,
            total: 0,
            submited: false,
            addModel: {
                pcbID: null, storeName: null, userID: null
            },
            editModel: {
                ID: null, pcbID: null, storeName: null, userID: null
            },
            deleteModel: {
                ID: null, pcbID: null, storeName: null, userID: null, confirm: null
            },
            accounts: [
                { text: 'Select Owner', value: null },
                { text: '1', value: 1 }
            ]
        }
    },
    watch: {
        unit: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.filteredData.length / this.unit);
        },
        filter: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.filteredData.length / this.unit);
        }
    },
    computed: {
        startRow: function () {
            let s = (this.currentPage - 1) * this.unit;
            if (this.total < s)
                s = this.total - 1;
            return s;
        },
        endRow: function () {
            let e = this.currentPage * this.unit;
            if (this.total < e)
                e = this.total;
            return e;
        },
        filteredData: function () {
            let rex = new RegExp(this.filter, "i");
            let _filtered = this.machines.items.filter(function (item) {
                return rex.test(item.storeName) || rex.test(item.pcbID);
            });
            return _filtered;
        },
        viewData: function () {
            let start = this.startRow;
            let end = this.endRow;
            return this.filteredData.slice(start, end);
        }
    },
    methods: {
        chkPageCurrent: function (page) {
            return this.currentPage != page || 'current';
        },
        getMachines: function () {
            let vm = this;
            vm.loading = true;
            this.$http.get('/api/machines').then(function (res) {
                vm.machines.items = res.body.data
                vm.total = res.body.total
                vm.totalPage = Math.ceil(vm.total / vm.unit);
                vm.loading = false;
            });
        },
        changePage: function (page) {
            let vm = this;
            vm.loading = true;
            setTimeout(() => {
                vm.loading = false;
                vm.currentPage = page;
            }, 200);
        },
        cancelAdd: function () {
            this.submited = false;
            this.addModel.pcbID = this.addModel.storeName = this.addModel.userID = null;
        },
        addMachine: function (ev) {
            let vm = this;
            if (vm.addModel.pcbID && vm.addModel.userID) {
                vm.submited = false;
                vm.$http.post('/api/machines/add', vm.addModel, {emulateJSON: true}).then(function (res) {
                    if(res.body.code == 200){
                        vm.getMachines();
                    }
                    else{
                        alert("Add Machine Error: " + res.body.message);
                    }
                });
            }
            else {
                this.submited = true;
                ev.preventDefault();
            }
        },
        cancelEdit: function () {
            this.submited = false;
            this.editModel.ID = this.editModel.pcbID = this.editModel.storeName = this.editModel.userID = null;
        },
        startEditMachine: function($event, id){
            let vm = this;
            vm.$http.get('/api/machines/' + id).then(function (res) {
                if(res.body.code == 200){
                    Vue.set(vm, "editModel", res.body.data);
                    vm.$root.$emit('bv::show::modal', 'editMachineDialog', $event.target);
                }
                else{
                    alert("Get Machine Data Error: " + res.body.message);
                }
            });
        },
        startDeleteMachine: function($event, id){
            let vm = this;
            vm.$http.get('/api/machines/' + id).then(function (res) {
                if(res.body.code == 200){
                    Vue.set(vm, "deleteModel", res.body.data);
                    vm.$root.$emit('bv::show::modal', 'deleteMachineDialog', $event.target);
                }
                else{
                    alert("Get Machine Data Error: " + res.body.message);
                }
            });
        },
        editMachine: function (ev) {
            let vm = this;
            if (vm.editModel.userID) {
                vm.submited = false;
                vm.$http.post('/api/machines/' + vm.editModel.ID, vm.editModel, {emulateJSON: true}).then(function (res) {
                    if(res.body.code == 200){
                        vm.getMachines();
                    }
                    else{
                        alert("Edit Machine Error: " + res.body.message);
                    }
                });
            }
            else {
                this.submited = true;
                ev.preventDefault();
            }
        },
        deleteMachine: function (ev) {
            let vm = this;
            if (vm.deleteModel.confirm == vm.deleteModel.pcbID) {
                vm.submited = false;
                vm.$http.delete('/api/machines/' + vm.deleteModel.ID).then(function (res) {
                    if(res.body.code == 200){
                        vm.getMachines();
                    }
                    else{
                        alert("Delete Machine Error: " + res.body.message);
                    }
                });
            }
            else {
                this.submited = true;
                ev.preventDefault();
            }
        }
    },
    created: function () {
        this.getMachines();
    },
    mounted: function () {
    }
};

const MachineTransfer = {
    data: function () {
        return {
            step: 1
        }
    },
    methods: {
        toStep: function (step) {
            this.step = step;
        },
        transfer: function () {

        }
    },
    mounted: function () {
        // activate Nestable for list 1
        $('.nestable').nestable({
            group: 1
        });
    }
};

const Core = {
    mixins: [common],
    data: function () {
        return {
            loading: false,
            filter: '',
            users: {items:[]},
            addModel: {
                account: null, password: null, confirm: null
            },
            pwdModel: {
                ID: null, account: null, password: null, confirm: null
            },
            unit: 10,
            currentPage: 1,
            totalPage: 1,
            submited: false
        }
    },
    watch: {
        unit: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.filteredData.length / this.unit);
        },
        filter: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.filteredData.length / this.unit);
        }
    },
    methods: {
        chkPageCurrent: function (page) {
            return this.currentPage != page || 'current';
        },
        chkPolicy: function(model){
            return this.chkAccount(model.account) && this.chkPassword(model.password) && model.password == model.confirm;
        },
        chkAccount: function(account){
            return /^[a-zA-Z0-9]{6,16}$/.test(account);
        },
        chkPassword: function(pwd){
            return /^(?=.*[0-9])(?=.*[a-z])([a-z0-9]{8,20})$/.test(pwd);
        },
        encryptedPassword: function(pwd){
            return CryptoJS.SHA512(pwd).toString(CryptoJS.enc.Hex)
        },
        getUsers: function () {
            let vm = this;
            vm.loading = true;
            this.$http.get('/api/coreusers').then(function (res) {
                vm.users.items = res.body.data
                vm.total = res.body.total
                vm.totalPage = Math.ceil(vm.total / vm.unit);
                vm.loading = false;
            });
        },
        toggleActive: function(id){
            let vm = this;
            let user = vm.users.items.filter(function(item){
                return item.ID === id;
            });
            if(user && user.length === 1){
                user = user[0];
                vm.$http.post('/api/coreusers/active/' + user.ID).then(function (res) {
                    if(res.body.code == 200 && res.body.data){
                        user.state = res.body.data.state;
                    }
                    else{
                        alert("Change active/deactive failed: " + res.body.message);
                    }
                });
            }
        },
        cancelAdd: function () {
            this.submited = false;
            this.addModel.account = this.addModel.password = this.addModel.confirm = null;
        },
        addUser: function (ev) {
            let vm = this;
            vm.submited = true;
            if (vm.chkPolicy(vm.addModel)) {
                vm.submited = false;
                delete vm.addModel.confirm;
                vm.addModel.password = vm.encryptedPassword(vm.addModel.password);
                vm.$http.post('/api/coreusers', vm.addModel, {emulateJSON: true}).then(function (res) {
                    if(res.body.code == 200){
                        vm.getUsers();
                    }
                    else{
                        alert("Add Machine Error: " + res.body.message);
                    }
                });
            }
            else {
                this.submited = true;
                ev.preventDefault();
            }
        },
        openChangePassword: function(id){
            let vm = this;
            let user = vm.users.items.filter(function(item){
                return item.ID === id;
            });
            if(user && user.length === 1){
                vm.pwdModel.account = user[0].account;
                vm.pwdModel.ID = user[0].ID;
            }
        },
        cancelChangePassword: function(){
            let vm = this;
            vm.pwdModel.ID = vm.pwdModel.account = vm.pwdModel.password = vm.pwdModel.confirm = null;
        },
        changePassword: function(ev){
            let vm = this;
            vm.submited = true;
            if (vm.chkPolicy(vm.pwdModel)) {
                vm.submited = false;
                delete vm.pwdModel.confirm;
                vm.pwdModel.password = vm.encryptedPassword(vm.pwdModel.password);
                vm.$http.post('/api/coreusers/password/' + vm.pwdModel.ID, vm.pwdModel, {emulateJSON: true}).then(function (res) {
                    if(res.body.code == 200){
                        alert("Password changed.");
                    }
                    else{
                        alert("Change password failed: " + res.body.message);
                    }
                });
            }
            else {
                vm.submited = true;
                ev.preventDefault();
            }
        },
        changePage: function (page) {
            let vm = this;
            vm.loading = true;
            setTimeout(() => {
                vm.loading = false;
                vm.currentPage = page;
            }, 200);
        },
        stateText: function (state) {
            switch (state) {
                case 1: return "Active";
                case 2: return "Deactive";
                case 3: return "Locked";
            }
        },
        stateButtonText: function (state) {
            switch (state) {
                case 1: return "Deactive";
                case 2: return "Active";
            }
        }
    },
    computed: {
        startRow: function () {
            let s = (this.currentPage - 1) * this.unit;
            if (this.users.items.length < s)
                s = this.users.items.length - 1;
            return s;
        },
        endRow: function () {
            let e = this.currentPage * this.unit;
            if (this.users.items.length < e)
                e = this.users.items.length;
            return e;
        },
        filteredData: function () {
            let rex = new RegExp(this.filter, "ig");
            let _filtered = this.users.items.filter(function (item) {
                return rex.test(item.account);
            });
            return _filtered;
        },
        viewData: function () {
            let start = this.startRow;
            let end = this.endRow;
            return this.filteredData.slice(start, end);
        }
    },
    created: function(){
        this.getUsers();
    },
    mounted: function () {
    }
};

const Agency = {
    mixins: [common],
    data: function () {
        return {
            loading: false,
            filter: '',
            accounts: fakeAccounts,
            unit: 10,
            currentPage: 1,
            totalPage: 1
        }
    },
    watch: {
        unit: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.filteredData.length / this.unit);
        },
        filter: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.filteredData.length / this.unit);
        }
    },
    methods: {
        chkPageCurrent: function (page) {
            return this.currentPage != page || 'current';
        },
        changePage: function (page) {
            let vm = this;
            vm.loading = true;
            setTimeout(() => {
                vm.loading = false;
                vm.currentPage = page;
            }, 200);
        },
        statusText: function (status) {
            switch (status) {
                case 1: return "Active";
                case 2: return "Locked";
                case 3: return "Deactive";
            }
        }
    },
    computed: {
        startRow: function () {
            let s = (this.currentPage - 1) * this.unit;
            if (this.accounts.items.length < s)
                s = this.accounts.items.length - 1;
            return s;
        },
        endRow: function () {
            let e = this.currentPage * this.unit;
            if (this.accounts.items.length < e)
                e = this.accounts.items.length;
            return e;
        },
        filteredData: function () {
            let rex = new RegExp(this.filter, "ig");
            let _filtered = this.accounts.items.filter(function (item) {
                return rex.test(item.account);
            });
            return _filtered;
        },
        viewData: function () {
            let start = this.startRow;
            let end = this.endRow;
            return this.filteredData.slice(start, end);
        }
    },
    mounted: function () {
        this.totalPage = Math.ceil(this.accounts.items.length / this.unit);
    }
};

const VersionSetting = {
    mixins: [common],
    data: function () {
        return {
            loading: false,
            filter: '',
            machines: fakeMachines,
            unit: 10,
            currentPage: 1,
            totalPage: 1
        }
    },
    watch: {
        unit: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.filteredData.length / this.unit);
        },
        filter: function () {
            this.currentPage = 1;
            this.totalPage = Math.ceil(this.filteredData.length / this.unit);
        }
    },
    methods: {
        chkPageCurrent: function (page) {
            return this.currentPage != page || 'current';
        },
        changePage: function (page) {
            let vm = this;
            vm.loading = true;
            setTimeout(() => {
                vm.loading = false;
                vm.currentPage = page;
            }, 200);
        },
        statusClass: function (status) {
            switch (status) {
                case 0: return "text-danger";
                case 1: return "text-success";
            }
        },
        statusText: function (status) {
            switch (status) {
                case 0: return "Offline";
                case 1: return "Online";
            }
        }
    },
    computed: {
        startRow: function () {
            let s = (this.currentPage - 1) * this.unit;
            if (this.machines.items.length < s)
                s = this.machines.items.length - 1;
            return s;
        },
        endRow: function () {
            let e = this.currentPage * this.unit;
            if (this.machines.items.length < e)
                e = this.machines.items.length;
            return e;
        },
        filteredData: function () {
            let rex = new RegExp(this.filter, "ig");
            let _filtered = this.machines.items.filter(function (item) {
                return rex.test(item.machineId) || rex.test(item.machineName) || rex.test(item.storeName) || rex.test(item.currentVersion);
            });
            return _filtered;
        },
        viewData: function () {
            let start = this.startRow;
            let end = this.endRow;
            return this.filteredData.slice(start, end);
        }
    },
    mounted: function () {
        this.totalPage = Math.ceil(this.machines.items.length / this.unit);
    }
};

const JPServer = {
    data: function () {
        return {
        }
    },
    mounted: function () {
    }
};

const router = new VueRouter({
    mode: 'history',
    base: '/',
    routes: [
        { path: '/', component: getTemplate('index', Home) },
        { path: '/machines/list', component: getTemplate('machines/list', MachineList) },
        { path: '/machines/transfer', component: getTemplate('machines/transfer', MachineTransfer) },
        { path: '/accounting/machines', component: getTemplate('accounting/accounting', Accounting) },
        { path: '/accounting/accounts', component: getTemplate('accounting/accounting', Accounting) },
        { path: '/accounting/stores', component: getTemplate('accounting/accounting', Accounting) },
        { path: '/operations/day', component: getTemplate('operations/operations', Operations) },
        { path: '/operations/week', component: getTemplate('operations/operations', Operations) },
        { path: '/operations/month', component: getTemplate('operations/operations', Operations) },
        { path: '/transactions', component: getTemplate('transactions/transactions', Transactions) },
        { path: '/users/core', component: getTemplate('users/core', Core) },
        { path: '/users/agency', component: getTemplate('users/agency', Agency) },
        { path: '/settings/version', component: getTemplate('settings/versionsetting', VersionSetting) },
        { path: '/settings/jpserver', component: getTemplate('settings/jpserver', JPServer) },
        { path: '/reports/jackpot', component: getTemplate('reports/jackpot', Home) },
    ]
})
var app = new Vue({
    router,
    delimiters: ['{/', '/}'],
    el: '#app',
    data: {
    },
    methods: {
        getAccounts: function (cb) {
            let r = [];
            for (var i = 0; i < 20; i++) {
                r.push({ text: 'test test' + i, id: i, check: true });
            } cb(r);
        },
        getStores: function (cb) {
            let r = [];
            for (var i = 0; i < 30; i++) {
                r.push({ text: 'test test' + i, id: i, check: true });
            } cb(r);
        },
        getMachines: function (cb) {
            let r = [];
            for (var i = 0; i < 50; i++) {
                r.push({ text: 'test test' + i, id: i, check: true });
            } cb(r);
        },
        getTransactionTypes: function (cb) {
            let r = [];
            for (var i = 0; i < 50; i++) {
                r.push({ text: 'test test' + i, id: i, check: true });
            } cb(r);
        },
        getGameTypes: function (cb) {
            let r = [];
            for (var i = 0; i < 10; i++) {
                r.push({ text: 'test test' + i, id: i, check: true });
            } cb(r);
        }
    },
    monted: function () {
    }
})