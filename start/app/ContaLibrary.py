class ContaLibrary():
    def abrir_conta(self, saldo = 0.0):
        self.saldo = 0.0
        self.depositar(saldo)

    def obter_saldo(self):
        return self.saldo

    def depositar(self, valor):
        self.saldo += valor

    def sacar(self, valor):
        self.saldo -= valor
        self.saldo -= 2.0


conta = ContaLibrary()
conta.abrir_conta()
conta.depositar(100.00)
print(conta.obter_saldo())